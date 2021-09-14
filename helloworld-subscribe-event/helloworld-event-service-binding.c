/*
 * Copyright (C) 2016 - 2020 "IoT.bzh"
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <json-c/json.h>
#include "wrap-json.h"

#define AFB_BINDING_VERSION 3
#include <afb/afb-binding.h>

#include <afb-timer.h>

static afb_event_t event;
static TimerHandleT *timer;

static void timerCount()
{
	static int timerCount = 0;
	int listeners = 0;

	if(afb_event_is_valid(event))
		listeners = afb_event_push(event, json_object_new_int(timerCount));

	timerCount++;
}

static void startTimer(afb_req_t request)
{
	char *timeruid;
	timer = (TimerHandleT*)calloc (1, sizeof(TimerHandleT));
	timer->delay = (uint) 1000;
	timer->count = -1; // run forever
	timer->uid = timeruid;
	TimerEvtStart(request->api, timer, timerCount, NULL);

	afb_req_success(request, NULL, "startTimer");

	AFB_REQ_NOTICE(request, "Invoked at startTimer");
}

static void subscribeSample(afb_req_t request)
{
	// Event not valid ? then creating one.
	if(! afb_event_is_valid(event))
		event = afb_api_make_event(request->api, "timerCount");

	if(afb_req_subscribe(request, event) < 0) {
		afb_req_fail(request, "Error", "Subscription operation failed");
		return;
	}

	afb_req_success(request, NULL, "subscribeSample");

	AFB_REQ_NOTICE(request, "Invoked at subscribe invocation");
}

static void unsubscribeSample(afb_req_t request)
{
	if(! afb_event_is_valid(event)) {
		afb_req_fail(request, "Invalid", "Event not valid");
		return;
	}

	if(afb_req_unsubscribe(request, event) < 0) {
		afb_req_fail(request, "Error", "Unsubscription operation failed");
		return;
	}

	afb_req_success(request, NULL, NULL);
	AFB_REQ_NOTICE(request, "Invoked at unsubscribe invocation");
}

static void infoSample(afb_req_t request) {

	json_object *response,
				*metadata, *groups,
				*eventsgroup, *eventsverbs,
				*infogroup, *infoverbs,
				*suscribeverb, *suscribeusage, *suscribesample,
				*unsuscribeverb, *unsuscribeusage, *unsuscribesample,
				*timerverb, *timerusage, *timersample,
				*infoverb, *infousage, *infosample;


	// Defining verbs
	wrap_json_pack(&suscribeusage, "{so*}",
                            "data", NULL
                        );
	suscribesample = json_object_new_array();
	wrap_json_pack(&suscribeverb, "{ss* ss* ss* so* sO}",
                            "uid", "subscribe",
                            "info", "subscribes to an event",
							"api", "subscribe",
							"usage", suscribeusage,
							"sample", suscribesample
                        );

	wrap_json_pack(&unsuscribeusage, "{so*}",
                            "data", NULL
                        );
	unsuscribesample = json_object_new_array();
	wrap_json_pack(&unsuscribeverb, "{ss* ss* ss* so* sO}",
                            "uid", "unsubscribe",
                            "info", "unsubscribes to an event",
							"api", "unsubscribe",
							"usage", unsuscribeusage,
							"sample", unsuscribesample
                        );


	wrap_json_pack(&timerusage, "{so*}",
                            "data", NULL
                        );
	timersample = json_object_new_array();
	wrap_json_pack(&timerverb, "{ss* ss* ss* so* sO}",
                            "uid", "startTimer",
                            "info", "starts a timer (use after an event subscription)",
							"api", "startTimer",
							"usage", timerusage,
							"sample", timersample
                        );

	wrap_json_pack(&infousage, "{so*}",
                            "data", NULL
                        );
	infosample = json_object_new_array();
	wrap_json_pack(&infoverb, "{ss* ss* ss* so* sO}",
                            "uid", "info",
                            "info", "provides informations on this binding",
							"api", "info",
							"usage", infousage,
							"sample", infosample
                        );

	// Defining groups of verbs
	groups = json_object_new_array();
	
	eventsverbs = json_object_new_array();
	json_object_array_add(eventsverbs, suscribeverb);
	json_object_array_add(eventsverbs, unsuscribeverb);
	json_object_array_add(eventsverbs, timerverb);
	wrap_json_pack(&eventsgroup, "{ss ss sO}",
                            "uid", "Events",
                            "info", "verbs related to handling events",
                            "verbs", eventsverbs
                        );	
	json_object_array_add(groups, eventsgroup);

	infoverbs = json_object_new_array();
	json_object_array_add(infoverbs, infoverb);
	wrap_json_pack(&infogroup, "{ss ss sO}",
                            "uid", "info",
                            "info", "info verbs on this binding",
                            "verbs", infoverbs
                        );
	
	json_object_array_add(groups, infogroup);

	// Populating metadata for info verb
	wrap_json_pack(&metadata, "{ss* ss* ss*}", 
                            "uid", "Helloworld-event",
                            "info", "A simple Helloworld binding about handling events",
                            "version", "1.0"
                        );

	// Generate global response
	wrap_json_pack(&response, "{so, sO}","metadata", metadata, "groups", groups);
	afb_req_success(request, response, NULL);
}


static const afb_verb_t verbs[] = {
	/*Without security*/
	{.verb = "startTimer", .session = AFB_SESSION_NONE, .callback = startTimer, .auth = NULL},

	{.verb = "subscribe", .session = AFB_SESSION_NONE, .callback = subscribeSample, .auth = NULL},
	{.verb = "unsubscribe", .session = AFB_SESSION_NONE, .callback = unsubscribeSample, .auth = NULL},
	{.verb = "info", .session = AFB_SESSION_NONE, .callback = infoSample, .auth = NULL},
	{NULL}
};

const afb_binding_t afbBindingExport = {
	.api = "helloworld-event",
	.specification = NULL,
	.verbs = verbs,
	.preinit = NULL,
	.init = NULL,
	.onevent = NULL,
	.userdata = NULL,
	.provide_class = NULL,
	.require_class = NULL,
	.require_api = NULL,
	.noconcurrency = 0
};
