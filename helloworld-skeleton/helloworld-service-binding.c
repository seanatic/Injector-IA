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
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include <wrap-json.h>
#include <time.h>
#include <assert.h>

#define AFB_BINDING_VERSION 3

#include <afb/afb-binding.h>
#include <afb-timer.h>

// #define REDIS_CONTAINER_API "redis-cloud"
// #define REDIS_CONTAINER_API "rp-cloud-pub-devel"
#define REDIS_CONTAINER_API "seanatic-pc-cloud"

#define API_REPLY_SUCCESS "success"
#define API_REPLY_FAILURE "failed"

// #define SHORT

#ifdef SHORT
	int nb_of_sensors = 18;	// nb of sensors in nominals_short.csv file
#else
	int nb_of_sensors = 85;	// nb of sensors in nominals_en.csv file
#endif

int refresh_time_s = 100;	// 0.1 seconds

typedef struct ers_sensor ers_sensor;
struct ers_sensor
{
	char * label;	// an ers label is 6 characters
	char * unit;
    char * value;
};


/* *********************************************
 * Utilitary functions
 * *********************************************/

// /!\ Causes virtual timer fails on binder side
void delay(int number_of_seconds)
{
    /* Converting time into milli_seconds */
    int milli_seconds = 1000 * number_of_seconds;
  
    /* Storing start time */
    clock_t start_time = clock();
  
    /* looping till required time is not achieved */
    while (clock() < start_time + milli_seconds);
}

static char * str_dup (const char * str)
{
	char * dup = NULL;

	if (str != NULL)
	{
		size_t size = strlen (str) + 1;
		dup = malloc (size);

		if (dup != NULL)
		{
			memcpy (dup, str, size);
		}
	}

	return dup;
}

/* *********************************************
 * Binding functions
 * *********************************************/

static void pingSample(afb_req_t request)
{
	static int pingcount = 0;

	afb_req_success_f(request, json_object_new_int(pingcount), "Ping count = %d", pingcount);

	AFB_API_NOTICE(afbBindingV3root, "Verbosity macro at level notice invoked at ping invocation count = %d", pingcount);

	pingcount++;
}

static void read_data(afb_req_t request)
{	
	int err = 0;

	afb_api_t api;

	json_object *argsJ = NULL;
	// json_object* argsJ = afb_req_json(request);
	json_object *responseJ = NULL;
	
	char *returnedError = NULL, *returnedInfo = NULL;

	err = wrap_json_pack (&argsJ, "{ s:s }", 
							"class", "N03100" );
    if (err){
        AFB_API_ERROR(api, "ts_mget() argument packing failed!");
        return;
    }

	err = afb_api_call_sync(request->api, REDIS_CONTAINER_API, "ts_mget", argsJ, &responseJ, &returnedError, &returnedInfo);
    if (err) {
        afb_req_fail_f(request,API_REPLY_FAILURE, "redis reading request failed!");
        return;
    }

	// AFB_API_INFO ( request->api, "DEBUG: afb_api_call_sync successfull" );

	// afb_req_success_f(request, responseJ, NULL);
	afb_req_success(request, responseJ, NULL);

	// free(argsJ);
	// free(responseJ);
	// free(returnedError);
	// free(returnedInfo);

	return;
}

static void inject_data( afb_req_t request )
{
	int err;

	afb_api_t api;
	json_object * argsJ = NULL;
	json_object *responseJ = NULL;
	char *returnedError = NULL, *returnedInfo = NULL;

	FILE * rfp = NULL;
	FILE * wfp = NULL;
	
	char * token = NULL;
	char * separator = ";";	// separator in nominals.csv file

	char * first_line = NULL;
    char * line = NULL;
    size_t len = 0;

	int it = 0;

	/* Declare an array of ers_sensor structure */
	ers_sensor * nominals[nb_of_sensors];
	for (it = 0 ; it < nb_of_sensors ; it++)
	{
		nominals[it] = malloc (sizeof (* nominals));
	}

	AFB_API_INFO ( request->api, "DEBUG: nominals array successfully allocated" );

	/* Open .csv file for reading and .txt file for debugging */
#ifdef SHORT
	// rfp = fopen( "/home/ubs-cloud/workspace/helloworld-binding/nominals_short.csv", "r" );
	rfp = fopen( "/home/ubs-cloud/workspace/helloworld-binding/nominals_mid.csv", "r" );
#else
	rfp = fopen( "/home/ubs-cloud/workspace/helloworld-binding/nominals_en.csv", "r" );
#endif
	wfp = fopen( "/home/ubs-cloud/workspace/helloworld-binding/test.txt", "w" );

	AFB_API_INFO ( request->api, "DEBUG: files successfully opened" );

	/* Get first line for labels */
	getline( &line, &len, rfp );
	token = strtok( line, separator );
	for (it = 0 ; it < nb_of_sensors ; it++)
	{
		// AFB_API_INFO ( request->api, "DEBUG: %d", it );
		nominals[it]->label = str_dup (token);
		token = strtok( NULL, separator );
	}
	/* Removing CR for the last token of the line */
	nominals[it-1]->label[strcspn(nominals[it-1]->label, "\r\n")] = '\0';

	// for( it = 0 ; it < nb_of_sensors ; ++it)
	// {
	// 	AFB_API_INFO ( request->api, "DEBUG: Label %d is = %s", it, nominals[it]->label );
	// }
	// AFB_API_INFO ( request->api, "DEBUG: first line successfully processed" );

	/* Get second line for units */
	getline( &line, &len, rfp );
	token = strtok (line, separator);
	for (it = 0 ; it < nb_of_sensors ; it++)
	{
		nominals[it]->unit = str_dup (token);
		token = strtok( NULL, separator );
	}
	/* Removing CR for the last token of the line */
	nominals[it-1]->unit[strcspn(nominals[it-1]->unit, "\r\n")] = '\0';

	// for( it = 0 ; it < nb_of_sensors ; ++it)
	// {
	// 	AFB_API_INFO ( request->api, "DEBUG: Label %d is = %s", it, nominals[it]->unit );
	// }
	// AFB_API_INFO ( request->api, "DEBUG: second line successfully processed" );

	/* Get every last lines for values */
	while ( ( getline( &line, &len, rfp ) ) != -1 ) 
	{
		/* Get every value of the current line */
		token = strtok (line, separator);
		for (it = 0 ; it < nb_of_sensors ; it++)
		{
			nominals[it]->value = str_dup (token);
			token = strtok( NULL, separator );	
		}
		/* Removing CR for the last token of the line */
		nominals[it-1]->value[strcspn(nominals[it-1]->value, "\r\n")] = '\0';
		// AFB_API_INFO ( request->api, "DEBUG: Last label value is = %s", nominals[it-1]->value );

		/* Send data to the Redis DB */
		for (it = 0 ; it < nb_of_sensors ; ++it)
		{	
			/* WRITE DB */
			err = wrap_json_pack (&argsJ, "{s:s, s:{s:s}}",
									"class", nominals[it]->label,
									"data", nominals[it]->unit, nominals[it]->value);
			if (err){
				AFB_API_ERROR(api, "ts_jinsert() argument packing failed!");
				return;
			}

			err = afb_api_call_sync(request->api, REDIS_CONTAINER_API, "ts_jinsert", argsJ, &responseJ, &returnedError, &returnedInfo);
			if (err) {
				afb_req_fail_f(request,API_REPLY_FAILURE, "redis reading request failed!");
				return;
			}
		}

		// /* Delay for simulate samples */
		// delay(refresh_time_s);
	}
	AFB_API_INFO ( request->api, "DEBUG: The rest of the file has been processed" );



	// AFB_API_INFO ( request->api, "DEBUG: First label last sample = %s", nominals[0]->label );
	// AFB_API_INFO ( request->api, "DEBUG: First unit last sample = %s", nominals[0]->unit );
	// AFB_API_INFO ( request->api, "DEBUG: First value last sample = %s", nominals[0]->value );

	// AFB_API_INFO ( request->api, "DEBUG: Second label last sample = %s", nominals[1]->label );
	// AFB_API_INFO ( request->api, "DEBUG: Second unit last sample = %s", nominals[1]->unit );
	// AFB_API_INFO ( request->api, "DEBUG: Second value last sample = %s", nominals[1]->value );

	// AFB_API_INFO ( request->api, "DEBUG: Last label last sample = %s", nominals[84]->label );
	// AFB_API_INFO ( request->api, "DEBUG: Last unit last sample = %s", nominals[84]->unit );
	// AFB_API_INFO ( request->api, "DEBUG: Last value last sample = %s", nominals[84]->value );

	/* Don't forget to close files and free memory */
	fclose( rfp );
	fclose( wfp );
	if ( first_line )
         free( first_line );
	if ( line )
         free( line );
	for (it = 0 ; it < nb_of_sensors ; it++)
	{
		free( nominals[it] );
	}

	afb_req_success( request, NULL, NULL );
}

// testArgsSample - return success only if argument is set to {"cezam": "open"}
static void testArgsSample(afb_req_t request)
{
	json_object *tmpJ;
	json_object *res = json_object_new_object();
	json_object *queryJ = afb_req_json(request);

	json_bool success = json_object_object_get_ex(queryJ, "cezam", &tmpJ);
	if (!success) {
		afb_req_fail_f(request, "ERROR", "key cezam not found in '%s'", json_object_get_string(queryJ));
		return;
	}

	if (json_object_get_type(tmpJ) != json_type_string) {
		afb_req_fail(request, "ERROR", "key cezam not a string");
		return;
	}

	if (strncmp(json_object_get_string(tmpJ), "open", 4) == 0) {
		json_object_object_add(res, "code", json_object_new_int(123456789));
		afb_req_success(request, res, NULL);
		return;
	}

	afb_req_fail_f(request, "ERROR", "value of cezam (%s) is not the expected one.",
				   json_object_get_string(queryJ));
}

static void infoSample(afb_req_t request) {

	json_object *response,
				*metadata, *groups,
				*generalgroup, *generalverbs,
				*infogroup, *infoverbs,
				*pingverb, *pingusage,
				*argsverb, *argsusage, *argssample,
				*rightargsample, *wrongargsample, *wrongargsampletwo,
				*infoverb;


	// Defining verbs
	wrap_json_pack(&pingusage, "{so*}",
                            "data", NULL
                        );
	wrap_json_pack(&pingverb, "{ss* ss* ss* so*}",
                            "uid", "ping",
                            "info", "sends ping",
							"api", "ping",
							"usage", pingusage
                        );

	wrap_json_pack(&argsusage, "{so*}",
                            "data", NULL
                        );

	wrap_json_pack(&rightargsample, "{ss*}",
                            "cezam", "open"
                        );
	wrap_json_pack(&wrongargsample, "{ss*}",
                            "foo", "bar"
                	);
	wrap_json_pack(&wrongargsampletwo, "{ss*}",
                            "cezam", "tada"
                	);
	argssample = json_object_new_array();
	json_object_array_add(argssample, wrongargsample);
	json_object_array_add(argssample, wrongargsampletwo);
	json_object_array_add(argssample, rightargsample);

	wrap_json_pack(&argsverb, "{ss* ss* ss* so* sO}",
                            "uid", "testargs",
                            "info", "Test arguments",
							"api", "testargs",
							"usage", argsusage,
							"sample", argssample
                        );

	wrap_json_pack(&infoverb, "{ss* ss* ss*}",
                            "uid", "info",
                            "info", "provides informations on this binding",
							"api", "info"
                        );

	// Defining groups of verbs
	groups = json_object_new_array();
	
	generalverbs = json_object_new_array();
	json_object_array_add(generalverbs, pingverb);
	json_object_array_add(generalverbs, argsverb);
	wrap_json_pack(&generalgroup, "{ss ss sO}",
                            "uid", "general",
                            "info", "verbs related to general tests on this binding",
                            "verbs", generalverbs
                        );	
	json_object_array_add(groups, generalgroup);

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
                            "uid", "Helloworld",
                            "info", "A simple Helloworld binding",
                            "version", "1.0"
                        );

	// Generate global response
	wrap_json_pack(&response, "{so, sO}","metadata", metadata, "groups", groups);
	afb_req_success(request, response, NULL);
}

static const struct afb_auth _afb_auths_v2_monitor[] = {
	{.type = afb_auth_Permission, .text = "urn:AGL:permission:monitor:public:set"},
	{.type = afb_auth_Permission, .text = "urn:AGL:permission:monitor:public:get"},
	{.type = afb_auth_Or, .first = &_afb_auths_v2_monitor[1], .next = &_afb_auths_v2_monitor[0]}
};

static const afb_verb_t verbs[] = {
	/*Without security*/
	{ .verb = "read_data", .callback = read_data, .info = "Read data from Redis" },
	{ .verb = "inject_data", .callback = inject_data, .info = "Inject simulated data to Redis from CSV file" },
	
	{.verb = "ping", .session = AFB_SESSION_NONE, .callback = pingSample, .auth = NULL},
	
	/*With security "urn:AGL:permission:monitor:public:get"*/
	/*{ .verb = "ping"     , .session = AFB_SESSION_NONE, .callback = pingSample  , .auth = &_afb_auths_v2_monitor[1]},*/

	{.verb = "testargs", .session = AFB_SESSION_NONE, .callback = testArgsSample, .auth = NULL},
	{.verb = "info", .session = AFB_SESSION_NONE, .callback = infoSample, .auth = NULL},
	{NULL}
};

const afb_binding_t afbBindingExport = {
	.api = "helloworld",
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
