nw_socket_handle_socket_event [C918.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C918.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C918.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C918.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C918.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C918] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1220 Failed : error 0:61 [61]
'@RnSuperapp | Tracker -> ', { event: 
   { name: 'widget_side_cta_clicked',
     data: 
      { eventAction: 'widget_side_cta_clicked',
        eventCategory: 'video_demo_booking_page',
        eventLabel: 'CTA_PLACEHOLDER_CARD | CREATED | AP9B7J | Start instant video call | --',
        source: 'app' } },
  type: 'everythingExceptCleverTap' }
'@RnSuperapp | Tracker -> ', { event: 
   { name: 'widget_viewed',
     data: 
      { eventAction: 'widget_viewed',
        eventCategory: 'video_demo_booking_page',
        eventLabel: 'CTA_PLACEHOLDER_CARD | CREATED | AP9B7J | -- | Start instant video call',
        source: 'app' } },
  type: 'everythingExceptCleverTap' }
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
LOGIN SDK:: Starting token refresh
'LOGIN SDK:: %cinfo: Automatic token refresh initiated due to 401', 'color: blue', { url: 'https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking',
  method: 'post' }
'LOGIN SDK:: %cinfo: Attempting to refresh access token', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: request headers', { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
  method: 'post',
  data: 
   { grant_type: 'refresh_token',
     refresh_token: 'ory_rt_m2-wUjCatq3UjrZVD_tqGzs5Oc6OSXhaR4eMz8Jkzmc.9B_3DHL95zyifPx22dAsD8ug0J3IEH1lxWrotOklbfs',
     client_id: 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
     redirect_uri: 'cars24://oauth' },
  headers: 
   { common: { Accept: 'application/json, text/plain, */*' },
     delete: {},
     get: {},
     head: {},
     post: { 'Content-Type': 'application/x-www-form-urlencoded' },
     put: { 'Content-Type': 'application/x-www-form-urlencoded' },
     patch: { 'Content-Type': 'application/x-www-form-urlencoded' },
     osName: 'ios',
     mediaSource: 'HELLO_AR',
     source: 'mobile',
     SOURCE: 'MobileApp',
     'Content-Type': 'application/json',
     'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99' },
  transformRequest: [ [Function: transformRequest] ],
  transformResponse: [ [Function: transformResponse] ],
  timeout: 0,
  withCredentials: true,
  adapter: [Function: xhrAdapter],
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-XSRF-TOKEN',
  maxContentLength: -1,
  maxBodyLength: -1,
  validateStatus: [Function: validateStatus],
  transitional: 
   { silentJSONParsing: true,
     forcedJSONParsing: true,
     clarifyTimeoutError: false } }
'LOGIN SDK:: RESPONSE', { data: 
   { success: true,
     message: 'Token data',
     data: 
      { access_token: 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyMywiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMiwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjE3ODNkYzhiLTY0ZmItNGVhYS05OTU3LWJmZWFiMzgyMDVjZCIsIm5iZiI6MTc3MzEzMTYyMiwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.b6bziLdbTzjWhGrJJjrMWMHiT1LAmzfx2XhDSrz6SFB-BJw5awXcX2INBfnnEABx56XxrBk9a_3VkoEy-vTEhw',
        session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
        token_type: 'bearer',

        expires_in: 900,
        refresh_token: 'ory_rt_eWVOGN0UwGvII6oNp2uRuQSZ4UzCBdQ9co6PoHqbaa4.iNJ09Gg5wAJst6sb-GrmZgzNxJA-hmHecf2q9tuabGw',
        refresh_token_expiry_in: 86400 } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e0fe6e9cd7-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json; charset=utf-8',
     date: 'Tue, 10 Mar 2026 08:33:42 GMT',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=yq6Z9ifV7n2raGWxzKsTdXq7s5SA5HbcTF0OZ1wrVYE-1773131622-1.0.1.1-8ckrcjQ51lw1FRKMYj6hTnod.kADfxQpDpT5HS2jLxcXPUnwWEvszudxyUK670xwLIyLJVZHsfNLwb02KXAARfGyPRuqEY4KRq.9xl9bvTs; path=/; expires=Tue, 10-Mar-26 09:03:42 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ] },
  config: 
   { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     method: 'post',
     data: '{"grant_type":"refresh_token","refresh_token":"ory_rt_m2-wUjCatq3UjrZVD_tqGzs5Oc6OSXhaR4eMz8Jkzmc.9B_3DHL95zyifPx22dAsD8ug0J3IEH1lxWrotOklbfs","client_id":"client_3L2Q2B-DFrgi2JiZYJAhRw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","redirect_uri":"cars24://oauth"}',
     headers: 
      { Accept: 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        source: 'mobile',
        SOURCE: 'MobileApp',
        'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
        'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        x_experiment_id: '664f4f0a-bcef-4191-a756-8de0a5385529',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     withCredentials: true,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false } },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'POST',
     _perfKey: 'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token',
     _response: '{"success":true,"message":"Token data","data":{"access_token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyMywiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMiwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjE3ODNkYzhiLTY0ZmItNGVhYS05OTU3LWJmZWFiMzgyMDVjZCIsIm5iZiI6MTc3MzEzMTYyMiwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.b6bziLdbTzjWhGrJJjrMWMHiT1LAmzfx2XhDSrz6SFB-BJw5awXcX2INBfnnEABx56XxrBk9a_3VkoEy-vTEhw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","token_type":"bearer","expires_in":900,"refresh_token":"ory_rt_eWVOGN0UwGvII6oNp2uRuQSZ4UzCBdQ9co6PoHqbaa4.iNJ09Gg5wAJst6sb-GrmZgzNxJA-hmHecf2q9tuabGw","refresh_token_expiry_in":86400}}',
     _url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185368796.902333,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.06475,
              totalTime: 1956.4894999861717 },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': { startTime: 183726569.826833, startExtras: undefined },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': 
            { startTime: 183726570.926458,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728507.258666,
              totalTime: 1936.332208007574 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183727596.36275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728556.613333,
              totalTime: 960.2505829930305 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183728313.313083,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728822.613666,
              totalTime: 509.3005830049515 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': 
            { startTime: 183728473.771125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728913.473083,
              totalTime: 439.70195800065994 },
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': 
            { startTime: 183728474.696791,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728834.236166,
              totalTime: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 202 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 250 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 251 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 252 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 253 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 254 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 255 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 256 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 257 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 258 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 259 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 260 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 261 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 262 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 264 exceeded limit of 200] } }
'LOGIN SDK:: %cbreadcrumb: Storing authentication tokens', 'color: black', { hasPhoneNumber: false,
  sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
✅ Provider app saving tokens with ownership metadata: unknown
✅ Tokens synced to cross-app storage
'LOGIN SDK:: %cinfo: Tokens stored successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: %cinfo: Access token refreshed successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
LOGIN SDK:: Token refresh successful
'LOGIN SDK:: %cinfo: Automatic token refresh successful', 'color: blue', undefined
'LOGIN SDK:: RESPONSE', { data: 
   { data: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        appInstanceId: 'D8E5F60D27104A749B497420F1263BC3',
        deviceType: 'ios',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        carCityId: 5,
        hubCode: 'LC_19',
        carCityCode: 'CC_5',
        totalAmount: 320000,
        vehiclePrice: 320000,
        chargeDetails: null,
        addedBenefits: null,
        bookingAmount: 0,
        pvtTokenAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        financeTerms: null,
        finalFinanceTerms: null,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           city: null,
           state: null,
           pincode: '122011',
           customerName: null,
           customerPhoneNumber: null,
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA',
           mapTxt: null,
           locationId: null,
           addressTag: null,
           addressType: null,
           distance: null },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        pickupTime: null,
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.160864Z',
        userDetailsSubmitted: false,
        bankStatementSubmitted: null,
        userVariant: 'B',
        cancelReason: null,
        offerExchange: null,
        pincodeServiceable: true,
        deliveryTime: 
         { slotKey: null,
           date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500' } ],
           reScheduleCount: null,
           version: 'v3' },
        deliveredDetails: null,
        orderReturnDetails: null,
        orderRating: null,
        orderRepairDetails: null,
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        classifiedSource: null,
        discount: null,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        additionalRoadTaxApplicable: null,
        systemMessage: null,
        save24Migration: null,
        targetPrice: null,
        originalPrice: 320000,
        orderReward: null,
        insurance: null,
        expireReason: null,
        invalid: null,
        reservationDetail: 
         { reservationChargesCategory: 'FREE',
           reservationCityMode: 'NO_RESERVE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        deliverySchedule: null,
        razorPayClientSource: null,
        apiVersion: 'V3',
        listingDiscountCoupons: [],
        financeOption: null,
        cancelRequest: null,
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        cfCorrectionStatus: null,
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        warrantyBookletVersion: null,
        selfCancelled: null,
        testDriveCompleted: null,
        videoTestDriveCompleted: null,
        carAlreadyTokened: null,
        isReschedule: false,
        pvtFlow: null,
        preVisitTokenDone: null,
        deliveryIntent: null,
        noCostEmiStatus: null,
        distance: null,
        postTokenVideoCall: null,
        isRescheduleAllowed: null,
        isPreSelected: null,
        shouldNotExpelVideoRequest: null,
        bi2BCExperimentEnabled: true },
     meta: {} },
  status: 201,
  statusText: undefined,
  headers: 
   { 'access-control-allow-credentials': 'true',
     'access-control-allow-origin': '*',
     'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e1d9ca22a8-DEL',
     'content-encoding': 'gzip',
     'content-security-policy': 'default-src \'self\';img-src \'self\' data: validator.swagger.io;script-src \'self\' https: \'unsafe-inline\';style-src \'self\' \'unsafe-inline\';base-uri \'self\';font-src \'self\' https: data:;form-action \'self\';frame-ancestors \'self\';object-src \'none\';script-src-attr \'none\';upgrade-insecure-requests',
     'content-type': 'application/json; charset=utf-8',
     'cross-origin-opener-policy': 'same-origin',
     'cross-origin-resource-policy': 'same-site',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     'origin-agent-cluster': '?1',
     priority: 'u=3,i',
     'referrer-policy': 'no-referrer',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=lovnbtXEN67pJuxHOFAH1rkjOrhrK9bz9ivEQWYISns-1773131623-1.0.1.1-p6qwMRLab4eYq.JfXiYJ.n2cUlKU1LOPDRTICUSl0nfjFsZ1_cAZ3ZToB9eNTI6Fr9vRIYIUqbA49TjvQQ7KyGfvsprw9Y8YbxxvZ28juCQ; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000; includeSubDomains; preload',
     vary: 'accept-encoding',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-dns-prefetch-control': 'off',
     'x-download-options': 'noopen',
     'x-frame-options': 'SAMEORIGIN',
     'x-permitted-cross-domain-policies': 'none',
     'x-xss-protection': '0' },
  config: 
   { url: 'https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking',
     method: 'post',
     data: '{"deliveryMode":"VIDEO","rescheduleTestDrive":true}',
     headers: 
      { Accept: 'application/json',
        'Content-Type': 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': [TOO BIG formatValueCalls 201 exceeded limit of 200],
        super_app_source: [TOO BIG formatValueCalls 202 exceeded limit of 200],
        'x-api-key': [TOO BIG formatValueCalls 203 exceeded limit of 200],
        X_APP_INSTANCE_ID: [TOO BIG formatValueCalls 204 exceeded limit of 200],
        'X-Device-Id': [TOO BIG formatValueCalls 205 exceeded limit of 200],
        userId: [TOO BIG formatValueCalls 206 exceeded limit of 200],
        x_experiment_id: [TOO BIG formatValueCalls 207 exceeded limit of 200],
        clientId: [TOO BIG formatValueCalls 208 exceeded limit of 200],
        'x-journey-type': [TOO BIG formatValueCalls 209 exceeded limit of 200],
        orderid: [TOO BIG formatValueCalls 210 exceeded limit of 200],
        X_UNIQUE_SESSION_ID: [TOO BIG formatValueCalls 211 exceeded limit of 200],
        offeringId: [TOO BIG formatValueCalls 212 exceeded limit of 200],
        Authorization: [TOO BIG formatValueCalls 213 exceeded limit of 200] },
     transformRequest: [TOO BIG formatValueCalls 214 exceeded limit of 200],
     transformResponse: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     timeout: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     adapter: [TOO BIG formatValueCalls 217 exceeded limit of 200],
     xsrfCookieName: [TOO BIG formatValueCalls 218 exceeded limit of 200],
     xsrfHeaderName: [TOO BIG formatValueCalls 219 exceeded limit of 200],
     maxContentLength: [TOO BIG formatValueCalls 220 exceeded limit of 200],
     maxBodyLength: [TOO BIG formatValueCalls 221 exceeded limit of 200],
     validateStatus: [TOO BIG formatValueCalls 222 exceeded limit of 200],
     transitional: [TOO BIG formatValueCalls 223 exceeded limit of 200],
     _retry: [TOO BIG formatValueCalls 224 exceeded limit of 200] },
  request: [TOO BIG formatValueCalls 225 exceeded limit of 200] }
'API Response https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking: 201', { data: 
   { data: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        appInstanceId: 'D8E5F60D27104A749B497420F1263BC3',
        deviceType: 'ios',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        carCityId: 5,
        hubCode: 'LC_19',
        carCityCode: 'CC_5',
        totalAmount: 320000,
        vehiclePrice: 320000,
        chargeDetails: null,
        addedBenefits: null,
        bookingAmount: 0,
        pvtTokenAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        financeTerms: null,
        finalFinanceTerms: null,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           city: null,
           state: null,
           pincode: '122011',
           customerName: null,
           customerPhoneNumber: null,
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA',
           mapTxt: null,
           locationId: null,
           addressTag: null,
           addressType: null,
           distance: null },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        pickupTime: null,
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.160864Z',
        userDetailsSubmitted: false,
        bankStatementSubmitted: null,
        userVariant: 'B',
        cancelReason: null,
        offerExchange: null,
        pincodeServiceable: true,
        deliveryTime: 
         { slotKey: null,
           date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500' } ],
           reScheduleCount: null,
           version: 'v3' },
        deliveredDetails: null,
        orderReturnDetails: null,
        orderRating: null,
        orderRepairDetails: null,
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        classifiedSource: null,
        discount: null,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        additionalRoadTaxApplicable: null,
        systemMessage: null,
        save24Migration: null,
        targetPrice: null,
        originalPrice: 320000,
        orderReward: null,
        insurance: null,
        expireReason: null,
        invalid: null,
        reservationDetail: 
         { reservationChargesCategory: 'FREE',
           reservationCityMode: 'NO_RESERVE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        deliverySchedule: null,
        razorPayClientSource: null,
        apiVersion: 'V3',
        listingDiscountCoupons: [],
        financeOption: null,
        cancelRequest: null,
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        cfCorrectionStatus: null,
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        warrantyBookletVersion: null,
        selfCancelled: null,
        testDriveCompleted: null,
        videoTestDriveCompleted: null,
        carAlreadyTokened: null,
        isReschedule: false,
        pvtFlow: null,
        preVisitTokenDone: null,
        deliveryIntent: null,
        noCostEmiStatus: null,
        distance: null,
        postTokenVideoCall: null,
        isRescheduleAllowed: null,
        isPreSelected: null,
        shouldNotExpelVideoRequest: null,
        bi2BCExperimentEnabled: true },
     meta: {} },
  status: 201,
  statusText: undefined,
  headers: 
   { 'access-control-allow-credentials': 'true',
     'access-control-allow-origin': '*',
     'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e1d9ca22a8-DEL',
     'content-encoding': 'gzip',
     'content-security-policy': 'default-src \'self\';img-src \'self\' data: validator.swagger.io;script-src \'self\' https: \'unsafe-inline\';style-src \'self\' \'unsafe-inline\';base-uri \'self\';font-src \'self\' https: data:;form-action \'self\';frame-ancestors \'self\';object-src \'none\';script-src-attr \'none\';upgrade-insecure-requests',
     'content-type': 'application/json; charset=utf-8',
     'cross-origin-opener-policy': 'same-origin',
     'cross-origin-resource-policy': 'same-site',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     'origin-agent-cluster': '?1',
     priority: 'u=3,i',
     'referrer-policy': 'no-referrer',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=lovnbtXEN67pJuxHOFAH1rkjOrhrK9bz9ivEQWYISns-1773131623-1.0.1.1-p6qwMRLab4eYq.JfXiYJ.n2cUlKU1LOPDRTICUSl0nfjFsZ1_cAZ3ZToB9eNTI6Fr9vRIYIUqbA49TjvQQ7KyGfvsprw9Y8YbxxvZ28juCQ; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000; includeSubDomains; preload',
     vary: 'accept-encoding',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-dns-prefetch-control': 'off',
     'x-download-options': 'noopen',
     'x-frame-options': 'SAMEORIGIN',
     'x-permitted-cross-domain-policies': 'none',
     'x-xss-protection': '0' },
  config: 
   { url: 'https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking',
     method: 'post',
     data: '{"deliveryMode":"VIDEO","rescheduleTestDrive":true}',
     headers: 
      { Accept: 'application/json',
        'Content-Type': 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': [TOO BIG formatValueCalls 201 exceeded limit of 200],
        super_app_source: [TOO BIG formatValueCalls 202 exceeded limit of 200],
        'x-api-key': [TOO BIG formatValueCalls 203 exceeded limit of 200],
        X_APP_INSTANCE_ID: [TOO BIG formatValueCalls 204 exceeded limit of 200],
        'X-Device-Id': [TOO BIG formatValueCalls 205 exceeded limit of 200],
        userId: [TOO BIG formatValueCalls 206 exceeded limit of 200],
        x_experiment_id: [TOO BIG formatValueCalls 207 exceeded limit of 200],
        clientId: [TOO BIG formatValueCalls 208 exceeded limit of 200],
        'x-journey-type': [TOO BIG formatValueCalls 209 exceeded limit of 200],
        orderid: [TOO BIG formatValueCalls 210 exceeded limit of 200],
        X_UNIQUE_SESSION_ID: [TOO BIG formatValueCalls 211 exceeded limit of 200],
        offeringId: [TOO BIG formatValueCalls 212 exceeded limit of 200],
        Authorization: [TOO BIG formatValueCalls 213 exceeded limit of 200] },
     transformRequest: [TOO BIG formatValueCalls 214 exceeded limit of 200],
     transformResponse: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     timeout: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     adapter: [TOO BIG formatValueCalls 217 exceeded limit of 200],
     xsrfCookieName: [TOO BIG formatValueCalls 218 exceeded limit of 200],
     xsrfHeaderName: [TOO BIG formatValueCalls 219 exceeded limit of 200],
     maxContentLength: [TOO BIG formatValueCalls 220 exceeded limit of 200],
     maxBodyLength: [TOO BIG formatValueCalls 221 exceeded limit of 200],
     validateStatus: [TOO BIG formatValueCalls 222 exceeded limit of 200],
     transitional: [TOO BIG formatValueCalls 223 exceeded limit of 200],
     _retry: [TOO BIG formatValueCalls 224 exceeded limit of 200] },
  request: [TOO BIG formatValueCalls 225 exceeded limit of 200] }
'API Response https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking: 201', { data: 
   { data: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        appInstanceId: 'D8E5F60D27104A749B497420F1263BC3',
        deviceType: 'ios',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        carCityId: 5,
        hubCode: 'LC_19',
        carCityCode: 'CC_5',
        totalAmount: 320000,
        vehiclePrice: 320000,
        chargeDetails: null,
        addedBenefits: null,
        bookingAmount: 0,
        pvtTokenAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        financeTerms: null,
        finalFinanceTerms: null,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           city: null,
           state: null,
           pincode: '122011',
           customerName: null,
           customerPhoneNumber: null,
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA',
           mapTxt: null,
           locationId: null,
           addressTag: null,
           addressType: null,
           distance: null },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        pickupTime: null,
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.160864Z',
        userDetailsSubmitted: false,
        bankStatementSubmitted: null,
        userVariant: 'B',
        cancelReason: null,
        offerExchange: null,
        pincodeServiceable: true,
        deliveryTime: 
         { slotKey: null,
           date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500' } ],
           reScheduleCount: null,
           version: 'v3' },
        deliveredDetails: null,
        orderReturnDetails: null,
        orderRating: null,
        orderRepairDetails: null,
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        classifiedSource: null,
        discount: null,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        additionalRoadTaxApplicable: null,
        systemMessage: null,
        save24Migration: null,
        targetPrice: null,
        originalPrice: 320000,
        orderReward: null,
        insurance: null,
        expireReason: null,
        invalid: null,
        reservationDetail: 
         { reservationChargesCategory: 'FREE',
           reservationCityMode: 'NO_RESERVE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        deliverySchedule: null,
        razorPayClientSource: null,
        apiVersion: 'V3',
        listingDiscountCoupons: [],
        financeOption: null,
        cancelRequest: null,
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        cfCorrectionStatus: null,
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        warrantyBookletVersion: null,
        selfCancelled: null,
        testDriveCompleted: null,
        videoTestDriveCompleted: null,
        carAlreadyTokened: null,
        isReschedule: false,
        pvtFlow: null,
        preVisitTokenDone: null,
        deliveryIntent: null,
        noCostEmiStatus: null,
        distance: null,
        postTokenVideoCall: null,
        isRescheduleAllowed: null,
        isPreSelected: null,
        shouldNotExpelVideoRequest: null,
        bi2BCExperimentEnabled: true },
     meta: {} },
  status: 201,
  statusText: undefined,
  headers: 
   { 'access-control-allow-credentials': 'true',
     'access-control-allow-origin': '*',
     'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e1d9ca22a8-DEL',
     'content-encoding': 'gzip',
     'content-security-policy': 'default-src \'self\';img-src \'self\' data: validator.swagger.io;script-src \'self\' https: \'unsafe-inline\';style-src \'self\' \'unsafe-inline\';base-uri \'self\';font-src \'self\' https: data:;form-action \'self\';frame-ancestors \'self\';object-src \'none\';script-src-attr \'none\';upgrade-insecure-requests',
     'content-type': 'application/json; charset=utf-8',
     'cross-origin-opener-policy': 'same-origin',
     'cross-origin-resource-policy': 'same-site',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     'origin-agent-cluster': '?1',
     priority: 'u=3,i',
     'referrer-policy': 'no-referrer',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=lovnbtXEN67pJuxHOFAH1rkjOrhrK9bz9ivEQWYISns-1773131623-1.0.1.1-p6qwMRLab4eYq.JfXiYJ.n2cUlKU1LOPDRTICUSl0nfjFsZ1_cAZ3ZToB9eNTI6Fr9vRIYIUqbA49TjvQQ7KyGfvsprw9Y8YbxxvZ28juCQ; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000; includeSubDomains; preload',
     vary: 'accept-encoding',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-dns-prefetch-control': 'off',
     'x-download-options': 'noopen',
     'x-frame-options': 'SAMEORIGIN',
     'x-permitted-cross-domain-policies': 'none',
     'x-xss-protection': '0' },
  config: 
   { url: 'https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking',
     method: 'post',
     data: '{"deliveryMode":"VIDEO","rescheduleTestDrive":true}',
     headers: 
      { Accept: 'application/json',
        'Content-Type': 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': [TOO BIG formatValueCalls 201 exceeded limit of 200],
        super_app_source: [TOO BIG formatValueCalls 202 exceeded limit of 200],
        'x-api-key': [TOO BIG formatValueCalls 203 exceeded limit of 200],
        X_APP_INSTANCE_ID: [TOO BIG formatValueCalls 204 exceeded limit of 200],
        'X-Device-Id': [TOO BIG formatValueCalls 205 exceeded limit of 200],
        userId: [TOO BIG formatValueCalls 206 exceeded limit of 200],
        x_experiment_id: [TOO BIG formatValueCalls 207 exceeded limit of 200],
        clientId: [TOO BIG formatValueCalls 208 exceeded limit of 200],
        'x-journey-type': [TOO BIG formatValueCalls 209 exceeded limit of 200],
        orderid: [TOO BIG formatValueCalls 210 exceeded limit of 200],
        X_UNIQUE_SESSION_ID: [TOO BIG formatValueCalls 211 exceeded limit of 200],
        offeringId: [TOO BIG formatValueCalls 212 exceeded limit of 200],
        Authorization: [TOO BIG formatValueCalls 213 exceeded limit of 200] },
     transformRequest: [TOO BIG formatValueCalls 214 exceeded limit of 200],
     transformResponse: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     timeout: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     adapter: [TOO BIG formatValueCalls 217 exceeded limit of 200],
     xsrfCookieName: [TOO BIG formatValueCalls 218 exceeded limit of 200],
     xsrfHeaderName: [TOO BIG formatValueCalls 219 exceeded limit of 200],
     maxContentLength: [TOO BIG formatValueCalls 220 exceeded limit of 200],
     maxBodyLength: [TOO BIG formatValueCalls 221 exceeded limit of 200],
     validateStatus: [TOO BIG formatValueCalls 222 exceeded limit of 200],
     transitional: [TOO BIG formatValueCalls 223 exceeded limit of 200],
     _retry: [TOO BIG formatValueCalls 224 exceeded limit of 200] },
  request: [TOO BIG formatValueCalls 225 exceeded limit of 200] }
'~~~appRedirection', 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive/?videoTestDrive=true&utm_source=app&offeringId=VIDEO_CALL_LIVE_FREE&orderId=AP9B7J&appointmentId=4450501923&umsAuthCode=~{umsAuthCodeQuery}', 'AP9B7J', '4450501923'
'@RnSuperapp | Tracker -> ', { event: 
   { name: 'widget_viewed',
     data: 
      { eventAction: 'widget_viewed',
        eventCategory: 'video_demo_booking_page',
        eventLabel: 'CTA_PLACEHOLDER_CARD | CREATED | AP9B7J | -- | Start instant video call',
        source: 'app' } },
  type: 'everythingExceptCleverTap' }
LOGIN SDK:: Starting token refresh
'LOGIN SDK:: %cinfo: Automatic token refresh initiated due to 401', 'color: blue', { url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta',
  method: 'get' }
'LOGIN SDK:: %cinfo: Attempting to refresh access token', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: request headers', { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
  method: 'post',
  data: 
   { grant_type: 'refresh_token',
     refresh_token: 'ory_rt_eWVOGN0UwGvII6oNp2uRuQSZ4UzCBdQ9co6PoHqbaa4.iNJ09Gg5wAJst6sb-GrmZgzNxJA-hmHecf2q9tuabGw',
     client_id: 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
     redirect_uri: 'cars24://oauth' },
  headers: 
   { common: { Accept: 'application/json, text/plain, */*' },
     delete: {},
     get: {},
     head: {},
     post: { 'Content-Type': 'application/x-www-form-urlencoded' },
     put: { 'Content-Type': 'application/x-www-form-urlencoded' },
     patch: { 'Content-Type': 'application/x-www-form-urlencoded' },
     osName: 'ios',
     mediaSource: 'HELLO_AR',
     source: 'mobile',
     SOURCE: 'MobileApp',
     'Content-Type': 'application/json',
     'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99' },
  transformRequest: [ [Function: transformRequest] ],
  transformResponse: [ [Function: transformResponse] ],
  timeout: 0,
  withCredentials: true,
  adapter: [Function: xhrAdapter],
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-XSRF-TOKEN',
  maxContentLength: -1,
  maxBodyLength: -1,
  validateStatus: [Function: validateStatus],
  transitional: 
   { silentJSONParsing: true,
     forcedJSONParsing: true,
     clarifyTimeoutError: false } }
'LOGIN SDK:: RESPONSE', { data: 
   { success: true,
     message: 'Token data',
     data: 
      { access_token: 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNCwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMywiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6Ijk3ZTc3MmU0LWMwMTAtNGM1OS1hMDY2LWU1ZGZmOGFjYjRkYiIsIm5iZiI6MTc3MzEzMTYyMywic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.fDUSBPWRGlhdBixhm8lREEEQQra9Jp9eZWVCJuNfjIi5wsRFpPYjoyG4wkk6pQ00VwM-loLZUk1UgsEKDZbHhg',
        session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
        token_type: 'bearer',

        expires_in: 900,
        refresh_token: 'ory_rt_gGdUDAniQB0KxcNx7OY6cevCx2MDCvhoGK1D8494nFY.MbUYF9USsvAP0pTGpGFAX91T2ggPlr-lFwJxJCdFyYA',
        refresh_token_expiry_in: 86400 } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e76bae9cd7-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json; charset=utf-8',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=_6g8QP7T0U_IDmM8_vMgdJ8fRgrrBOkLO7jNIxR1AnM-1773131623-1.0.1.1-7CGj0LvaYlKLetTSXW1L1YKV9ZUOgOkKkrm7sT13BkUmi6yy7bNd0JaudcLkv4IS5WOsCzd8Zo0iSmRfxlau2HJ08O59Vss62ElsRgATimk; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ] },
  config: 
   { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     method: 'post',
     data: '{"grant_type":"refresh_token","refresh_token":"ory_rt_eWVOGN0UwGvII6oNp2uRuQSZ4UzCBdQ9co6PoHqbaa4.iNJ09Gg5wAJst6sb-GrmZgzNxJA-hmHecf2q9tuabGw","client_id":"client_3L2Q2B-DFrgi2JiZYJAhRw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","redirect_uri":"cars24://oauth"}',
     headers: 
      { Accept: 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        source: 'mobile',
        SOURCE: 'MobileApp',
        'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
        'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        x_experiment_id: '664f4f0a-bcef-4191-a756-8de0a5385529',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     withCredentials: true,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false } },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'POST',
     _perfKey: 'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token',
     _response: '{"success":true,"message":"Token data","data":{"access_token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNCwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMywiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6Ijk3ZTc3MmU0LWMwMTAtNGM1OS1hMDY2LWU1ZGZmOGFjYjRkYiIsIm5iZiI6MTc3MzEzMTYyMywic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.fDUSBPWRGlhdBixhm8lREEEQQra9Jp9eZWVCJuNfjIi5wsRFpPYjoyG4wkk6pQ00VwM-loLZUk1UgsEKDZbHhg","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","token_type":"bearer","expires_in":900,"refresh_token":"ory_rt_gGdUDAniQB0KxcNx7OY6cevCx2MDCvhoGK1D8494nFY.MbUYF9USsvAP0pTGpGFAX91T2ggPlr-lFwJxJCdFyYA","refresh_token_expiry_in":86400}}',
     _url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185369832.928541,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.06475,
              totalTime: 1956.4894999861717 },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': { startTime: 183726569.826833, startExtras: undefined },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': 
            { startTime: 183726570.926458,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728507.258666,
              totalTime: 1936.332208007574 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183727596.36275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728556.613333,
              totalTime: 960.2505829930305 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183728313.313083,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728822.613666,
              totalTime: 509.3005830049515 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': 
            { startTime: 183728473.771125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728913.473083,
              totalTime: 439.70195800065994 },
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': 
            { startTime: 183728474.696791,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728834.236166,
              totalTime: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 202 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 251 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 252 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 253 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 254 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 255 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 256 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 257 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 258 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 259 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 260 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 261 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 262 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 265 exceeded limit of 200] } }
'LOGIN SDK:: %cbreadcrumb: Storing authentication tokens', 'color: black', { hasPhoneNumber: false,
  sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
✅ Provider app saving tokens with ownership metadata: unknown
✅ Tokens synced to cross-app storage
'LOGIN SDK:: %cinfo: Tokens stored successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: %cinfo: Access token refreshed successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
LOGIN SDK:: Token refresh successful
'LOGIN SDK:: %cinfo: Automatic token refresh successful', 'color: blue', undefined
'LOGIN SDK:: RESPONSE', { data: 
   { callerId: 'Cars24 Customer',
     product: 
      { id: '4450501923',
        url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923',
        image: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format',
        registrationNumber: 'DL01**0014',
        name: '2014 Toyota Innova',
        description: 'Diesel | Automatic | 69958 km | 3.20 lakh' },
     videoCallUrl: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}',
     callEndRedirectionUrl: 'pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK',
     businessUnit: 'BUY',
     journey: 'VIDEO_TEST_DRIVE',
     tenantId: 'INDIA_VIDEO_PLATFORM',
     orderId: 'AP9B7J',
     serviceRequestId: 'AP9B7J-SR-1',
     vehicleId: '4450501923',
     uniqueSessionId: '{{x_unique_session_id}}',
     userId: '55e2c318-e242-45d3-aead-30dce37e3fd5' },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e86e06bf12-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     expires: '0',
     pragma: 'no-cache',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=T2x91jw8mu1d8C0axdJ7HDAI7OhSxsUKeMRET84jC0Q-1773131623-1.0.1.1-j50ICetKwSVYOcPL8ajlbHHe2SHSITxmWc5S3NPGLnk1fyltLC7zqM1KznNPaN5pBfNhtBvelqcI.Awf4iIsKgRB5l.LBDjffbXSPnUPio8; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000 ; includeSubDomains',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-frame-options': 'DENY',
     'x-xss-protection': '1; mode=block' },
  config: 
   { url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta',
     method: 'get',
     headers: 
      { Accept: 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': '5',
        super_app_source: 'consumer_india',
        'x-api-key': 'e3d5b7c4f27a8d9b0a12cd34ef56ab78',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3',
        'X-Device-Id': 'D8E5F60D27104A749B497420F1263BC3',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        x_experiment_id: undefined,
        clientId: null,
        x_country: 'IN',
        x_vehicle_type: 'car',
        Authorization: 'Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNCwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMywiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6Ijk3ZTc3MmU0LWMwMTAtNGM1OS1hMDY2LWU1ZGZmOGFjYjRkYiIsIm5iZiI6MTc3MzEzMTYyMywic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.fDUSBPWRGlhdBixhm8lREEEQQra9Jp9eZWVCJuNfjIi5wsRFpPYjoyG4wkk6pQ00VwM-loLZUk1UgsEKDZbHhg' },
     params: { orderId: 'AP9B7J', appointmentId: '4450501923' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false },
     _retry: true,
     data: undefined },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'GET',
     _perfKey: 'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _response: '{"callerId":"Cars24 Customer","product":{"id":"4450501923","url":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923","image":"https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format","registrationNumber":"DL01**0014","name":"2014 Toyota Innova","description":"Diesel | Automatic | 69958 km | 3.20 lakh"},"videoCallUrl":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}","callEndRedirectionUrl":"pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK","businessUnit":"BUY","journey":"VIDEO_TEST_DRIVE","tenantId":"INDIA_VIDEO_PLATFORM","orderId":"AP9B7J","serviceRequestId":"AP9B7J-SR-1","vehicleId":"4450501923","uniqueSessionId":"{{x_unique_session_id}}","userId":"55e2c318-e242-45d3-aead-30dce37e3fd5"}',
     _url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185369994.136666,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: [TOO BIG formatValueCalls 201 exceeded limit of 200],
              totalTime: [TOO BIG formatValueCalls 202 exceeded limit of 200] },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 252 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 253 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 254 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 255 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 256 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 257 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 258 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 259 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 260 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 261 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 262 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 266 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 267 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 268 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 269 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 270 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 271 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 272 exceeded limit of 200] } }
'API Response https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta: 200', { data: 
   { callerId: 'Cars24 Customer',
     product: 
      { id: '4450501923',
        url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923',
        image: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format',
        registrationNumber: 'DL01**0014',
        name: '2014 Toyota Innova',
        description: 'Diesel | Automatic | 69958 km | 3.20 lakh' },
     videoCallUrl: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}',
     callEndRedirectionUrl: 'pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK',
     businessUnit: 'BUY',
     journey: 'VIDEO_TEST_DRIVE',
     tenantId: 'INDIA_VIDEO_PLATFORM',
     orderId: 'AP9B7J',
     serviceRequestId: 'AP9B7J-SR-1',
     vehicleId: '4450501923',
     uniqueSessionId: '{{x_unique_session_id}}',
     userId: '55e2c318-e242-45d3-aead-30dce37e3fd5' },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e86e06bf12-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     expires: '0',
     pragma: 'no-cache',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=T2x91jw8mu1d8C0axdJ7HDAI7OhSxsUKeMRET84jC0Q-1773131623-1.0.1.1-j50ICetKwSVYOcPL8ajlbHHe2SHSITxmWc5S3NPGLnk1fyltLC7zqM1KznNPaN5pBfNhtBvelqcI.Awf4iIsKgRB5l.LBDjffbXSPnUPio8; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000 ; includeSubDomains',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-frame-options': 'DENY',
     'x-xss-protection': '1; mode=block' },
  config: 
   { url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta',
     method: 'get',
     headers: 
      { Accept: 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': '5',
        super_app_source: 'consumer_india',
        'x-api-key': 'e3d5b7c4f27a8d9b0a12cd34ef56ab78',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3',
        'X-Device-Id': 'D8E5F60D27104A749B497420F1263BC3',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        x_experiment_id: undefined,
        clientId: null,
        x_country: 'IN',
        x_vehicle_type: 'car',
        Authorization: 'Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNCwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMywiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6Ijk3ZTc3MmU0LWMwMTAtNGM1OS1hMDY2LWU1ZGZmOGFjYjRkYiIsIm5iZiI6MTc3MzEzMTYyMywic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.fDUSBPWRGlhdBixhm8lREEEQQra9Jp9eZWVCJuNfjIi5wsRFpPYjoyG4wkk6pQ00VwM-loLZUk1UgsEKDZbHhg' },
     params: { orderId: 'AP9B7J', appointmentId: '4450501923' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false },
     _retry: true,
     data: undefined },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'GET',
     _perfKey: 'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _response: '{"callerId":"Cars24 Customer","product":{"id":"4450501923","url":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923","image":"https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format","registrationNumber":"DL01**0014","name":"2014 Toyota Innova","description":"Diesel | Automatic | 69958 km | 3.20 lakh"},"videoCallUrl":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}","callEndRedirectionUrl":"pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK","businessUnit":"BUY","journey":"VIDEO_TEST_DRIVE","tenantId":"INDIA_VIDEO_PLATFORM","orderId":"AP9B7J","serviceRequestId":"AP9B7J-SR-1","vehicleId":"4450501923","uniqueSessionId":"{{x_unique_session_id}}","userId":"55e2c318-e242-45d3-aead-30dce37e3fd5"}',
     _url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185369994.136666,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: [TOO BIG formatValueCalls 201 exceeded limit of 200],
              totalTime: [TOO BIG formatValueCalls 202 exceeded limit of 200] },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 252 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 253 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 254 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 255 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 256 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 257 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 258 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 259 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 260 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 261 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 262 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 266 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 267 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 268 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 269 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 270 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 271 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 272 exceeded limit of 200] } }
'API Response https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta: 200', { data: 
   { callerId: 'Cars24 Customer',
     product: 
      { id: '4450501923',
        url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923',
        image: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format',
        registrationNumber: 'DL01**0014',
        name: '2014 Toyota Innova',
        description: 'Diesel | Automatic | 69958 km | 3.20 lakh' },
     videoCallUrl: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}',
     callEndRedirectionUrl: 'pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK',
     businessUnit: 'BUY',
     journey: 'VIDEO_TEST_DRIVE',
     tenantId: 'INDIA_VIDEO_PLATFORM',
     orderId: 'AP9B7J',
     serviceRequestId: 'AP9B7J-SR-1',
     vehicleId: '4450501923',
     uniqueSessionId: '{{x_unique_session_id}}',
     userId: '55e2c318-e242-45d3-aead-30dce37e3fd5' },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9e86e06bf12-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json',
     date: 'Tue, 10 Mar 2026 08:33:43 GMT',
     expires: '0',
     pragma: 'no-cache',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=T2x91jw8mu1d8C0axdJ7HDAI7OhSxsUKeMRET84jC0Q-1773131623-1.0.1.1-j50ICetKwSVYOcPL8ajlbHHe2SHSITxmWc5S3NPGLnk1fyltLC7zqM1KznNPaN5pBfNhtBvelqcI.Awf4iIsKgRB5l.LBDjffbXSPnUPio8; path=/; expires=Tue, 10-Mar-26 09:03:43 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ],
     'strict-transport-security': 'max-age=31536000 ; includeSubDomains',
     via: '1.1 google',
     'x-content-type-options': 'nosniff',
     'x-frame-options': 'DENY',
     'x-xss-protection': '1; mode=block' },
  config: 
   { url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta',
     method: 'get',
     headers: 
      { Accept: 'application/json',
        'accept-language': 'en-US,en;q=0.9',
        X_VEHICLE_TYPE: 'car',
        X_COUNTRY: 'IN',
        'x-client-type': 'APP_IOS',
        pincode: '',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        x_tenant_id: 'INDIA_CAR_LISTING',
        SOURCE: 'MobileApp',
        'sdk-app-number': '566',
        'sdk-app-name': '20.0.6',
        'sdk-os-name': 'ios',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        'x-user-city-id': '5',
        super_app_source: 'consumer_india',
        'x-api-key': 'e3d5b7c4f27a8d9b0a12cd34ef56ab78',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3',
        'X-Device-Id': 'D8E5F60D27104A749B497420F1263BC3',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        x_experiment_id: undefined,
        clientId: null,
        x_country: 'IN',
        x_vehicle_type: 'car',
        Authorization: 'Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNCwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyMywiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6Ijk3ZTc3MmU0LWMwMTAtNGM1OS1hMDY2LWU1ZGZmOGFjYjRkYiIsIm5iZiI6MTc3MzEzMTYyMywic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.fDUSBPWRGlhdBixhm8lREEEQQra9Jp9eZWVCJuNfjIi5wsRFpPYjoyG4wkk6pQ00VwM-loLZUk1UgsEKDZbHhg' },
     params: { orderId: 'AP9B7J', appointmentId: '4450501923' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false },
     _retry: true,
     data: undefined },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'GET',
     _perfKey: 'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _response: '{"callerId":"Cars24 Customer","product":{"id":"4450501923","url":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923","image":"https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format","registrationNumber":"DL01**0014","name":"2014 Toyota Innova","description":"Diesel | Automatic | 69958 km | 3.20 lakh"},"videoCallUrl":"https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}","callEndRedirectionUrl":"pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK","businessUnit":"BUY","journey":"VIDEO_TEST_DRIVE","tenantId":"INDIA_VIDEO_PLATFORM","orderId":"AP9B7J","serviceRequestId":"AP9B7J-SR-1","vehicleId":"4450501923","uniqueSessionId":"{{x_unique_session_id}}","userId":"55e2c318-e242-45d3-aead-30dce37e3fd5"}',
     _url: 'https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185369994.136666,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: [TOO BIG formatValueCalls 201 exceeded limit of 200],
              totalTime: [TOO BIG formatValueCalls 202 exceeded limit of 200] },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 252 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 253 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 254 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 255 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 256 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 257 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 258 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 259 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 260 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 261 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 262 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 266 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 267 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 268 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 269 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 270 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 271 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 272 exceeded limit of 200] } }
'@RnSuperapp | isVtdSdkEnabled -> ', true
'@RnSuperapp | Native Video Call -> ', { orderId: 'AP9B7J',
  appointmentId: '4450501923',
  hubCode: '',
  callMetaData: 
   { callerId: 'Cars24 Customer',
     product: 
      { id: '4450501923',
        url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923',
        image: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format',
        registrationNumber: 'DL01**0014',
        name: '2014 Toyota Innova',
        description: 'Diesel | Automatic | 69958 km | 3.20 lakh' },
     videoCallUrl: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}',
     callEndRedirectionUrl: 'pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK',
     businessUnit: 'BUY',
     journey: 'VIDEO_TEST_DRIVE',
     tenantId: 'INDIA_VIDEO_PLATFORM',
     orderId: 'AP9B7J',
     serviceRequestId: 'AP9B7J-SR-1',
     vehicleId: '4450501923',
     uniqueSessionId: '{{x_unique_session_id}}',
     userId: '55e2c318-e242-45d3-aead-30dce37e3fd5' },
  onEvent: [Function] }
🎥 [VideoCallHandler] ========================================
🎥 [VideoCallHandler] handleNativeVideoCall called
'🎥 [VideoCallHandler] orderId:', 'AP9B7J'
'🎥 [VideoCallHandler] hubCode:', ''
🎥 [VideoCallHandler] ========================================
🎥 [VideoCallHandler] Navigating to loader screen...
'🎥 [VideoCallHandler] User:', 'Customer name'
🎥 [VideoCallHandler] Setting up event listeners...
'🎥 [VideoCallHandler] onEvent listener:', 'provided'
ScreenView [0] setFrame: {{0, 0}, {0, 0}}
🎧 PopinBridge: Setting global event handler
🎧 PopinBridge: Subscribed to all events
🎥 [VideoCallHandler] ✅ Event listeners set up
🎥 [VideoCallHandler] Starting video test drive (with delay)...
nw_socket_handle_socket_event [C921:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C921 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 921: received failure notification
Connection 921: failed to connect 1:61, reason -1
Connection 921: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C921] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C921] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <1B8B3FD6-78FA-4D08-A86E-A43B16B5DAC5>.<105> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <1B8B3FD6-78FA-4D08-A86E-A43B16B5DAC5>.<105> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303e0dc20 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <1B8B3FD6-78FA-4D08-A86E-A43B16B5DAC5>.<105>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <1B8B3FD6-78FA-4D08-A86E-A43B16B5DAC5>.<105>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
'on nav state change =====>', { stale: false,
  type: 'stack',
  key: 'stack-EpJW91hgPUjynlKhb-HKl',
  index: 3,
  routeNames: 
   [ 'Splash',
     'homeTab',
     'buyTab',
     'FASTAG_STACK',
     'Branches',
     'user_onboarding_screen_shown',
     'GetStartedScreen',
     'city_selector_screen_shown',
     'GroupedCities',
     'CallbackRequestScreen',
     'NeedHelpScreen',
     'InternetDisconnectedModal',
     'VideoCallLoaderScreen',
     'EasterEgg',
     'Web_view',
     'GenericWebViewModal',
     'AppBrowser',
     'SuperHome',
     'MyCarsBuy',
     'MyCars',
     'UserProfile',
     'BuyUsedCar',
     'GSandMarketPlaceWrapper',
     'NewCarDetail',
     'C2CSearchModal',
     'UnifiedSearchModal',
     'GalleryView',
     'LoginScreen',
     'WishlistComponent',
     'PersonalisedCarListComponent',
     'MyBookings',
     'UploadStatementPasswordScreen',
     'CarExchange',
     'GSCustomizeOffer',
     'GSConfirmBooking',
     'CheckoutFlowLoader',
     'GSKYCUpload',
     'ChatBotWebView_popup',
     'GSCancelBookingScreen',
     'CancelCancelledCar',
     'VariantShiftScreen',
     'AnalyticsLogger',
     'HelpHome',
     'AppPermissionScreen',
     'AppPermissionScreenModal',
     'TransactionHistoryScene',
     'TrackCarComponentScene',
     'CarFeatsAndSpecs',
     'ExchangeProgram',
     'CarCompare',
     'Help',
     'MultipleUsersScreen',
     'HubDirection',
     'GSCongratulationsV3',
     'PostCheckoutV1',
     'CarReturnComponentV1',
     'AllTicketsComponentV1',
     'RaiseZendeskTicketComponentV1',
     'UploadDocumentV1',
     'ZendeskTicketCommentsComponentV1',
     'ViewAllOffers',
     'PostCheckoutMyOrdersV1',
     'PostCheckoutWarrantyOrderDetail',
     'PostCheckoutWarrantyOrderRedirection',
     'RCTransferScene',
     'FaqContactUs',
     'FaqContactUsV2',
     'OrderSummaryV3',
     'ABVariantsInfo',
     'MrlWebview',
     'FullMapScreen',
     'DeliveryChecklist',
     'VisitRating',
     'DeliveryChecklistItems',
     'DeliveryRefundDetails',
     'DeliveryESign',
     'DeliveryOtpScreen',
     'ProfileMenu',
     'FilterScreen',
     'MarketPlaceFilterScreen',
     'ChargesBreakupScreen',
     'PaymentMethods',
     'NeftDetailsScreen',
     'AddMoreVisitCar',
     'CashPaymentDetailScreen',
     'InsuranceClaimProcess',
     'InsuranceNotCoveredItems',
     'InsurancePlanDetails',
     'TicketList',
     'TestDriveExperience',
     'OnBoardingUserDetail',
     'Cars24AddOns',
     'InsurancePlans',
     'NomineeDetails',
     'TcsDetails',
     'AddOnDetails',
     'BuyBackDetails',
     'BuyBackFairUsage',
     'AddOnWarranty',
     'AddOnVasProduct',
     'VasAccessoriesDetails',
     'ReturnInProgressDetails',
     'SingleImageViewer',
     'NewInspectionReport',
     'VerticalGallery',
     'NewWarrantyModal',
     'MultiCarCancelBooking',
     'PhysicalRcSteps',
     'DocumentsScreen',
     'AllTicketsScreen',
     'HelpDetail',
     'RCStages',
     'RCCompletedScreen',
     'RCEditAddress',
     'DetailedServiceHistory',
     'GSServiceHistoryOrderRedirection',
     'EsignStatusScreen',
     'Warranty',
     'WarrantyCoverage',
     'WarrantyCoverageSubPart',
     'RepairRequested',
     'WarrantyTicketDetails',
     'SpinTheWheel',
     'B2CVSummary',
     'FACEBOOK_LANDING',
     'WarrantyCategoriesSearch',
     'DigitalRC',
     'categoryPage',
     'NpsFeedbackScreen',
     'DevOptionsScreen',
     'RSA',
     'ServiceHistory',
     'RSAServiceDetail',
     'AMCBookingScreen',
     'BookAMCAppointment',
     'AmcFeedbackScreen',
     'AddNewAddress',
     'CsatFeedbackScreen',
     'LoanWithTokenStatus',
     'TokenBankingNudge',
     'TokenSuccessScreen',
     'PostVisitSummary',
     'RCDocumentUpload',
     'TokenCancellation',
     'TokenCancellationFeedback',
     'TokenBillDetailsScreen',
     'SwiperScreen',
     'FilePreview',
     'MultiFilesPreview',
     'Muhurat',
     'PostDeliveryBuyBack',
     'TestDriveFlowV3',
     'PostBookingSummaryV3',
     'TestDriveFlowV2',
     'AddressesManagement',
     'PostDeliveryLoan',
     'LoanPartners',
     'CancellationFeedBack',
     'ServiceHistoryOrderConfirmation',
     'GenericModal',
     'GenericOverlay',
     'DocumentScreen',
     'AppAssets',
     'ChangeBaseUrls',
     'NetworkLogger',
     'SimilarCarsPage',
     'CommunicationPreference',
     'ServiceTourFullScreenModel',
     'BillDetailsScreen',
     'PostDeliveryInsurance',
     'ViewAllUpdates',
     'WISHLIST_STANDALONE',
     'PreCheckoutToken',
     'PostCheckoutToken',
     'PVTTokenCancellation',
     'PayRemainingAmount',
     'PaymentJourney',
     'ProceedToPaymentSelection',
     'HubSlotBooking',
     'HubDetailsPage',
     'HubVisitDetails',
     'HelpMeChoose',
     'VerticalGalleryRevamped',
     'CarCategoryInfoScreen',
     'CarlessVerticalGallery',
     'SellerRedirectionScreen',
     'LocationTabs',
     'ListingPage',
     'home_screen_shown',
     'Car_Details_Modal_Screen',
     'book_appointment_screen_BI',
     'confirm_appointment',
     'web_quote_screen_shown',
     'OdometerScreen',
     [TOO BIG formatValueCalls 201 exceeded limit of 200],
     [TOO BIG formatValueCalls 202 exceeded limit of 200],
     [TOO BIG formatValueCalls 203 exceeded limit of 200],
     [TOO BIG formatValueCalls 204 exceeded limit of 200],
     [TOO BIG formatValueCalls 205 exceeded limit of 200],
     [TOO BIG formatValueCalls 206 exceeded limit of 200],
     [TOO BIG formatValueCalls 207 exceeded limit of 200],
     [TOO BIG formatValueCalls 208 exceeded limit of 200],
     [TOO BIG formatValueCalls 209 exceeded limit of 200],
     [TOO BIG formatValueCalls 210 exceeded limit of 200],
     [TOO BIG formatValueCalls 211 exceeded limit of 200],
     [TOO BIG formatValueCalls 212 exceeded limit of 200],
     [TOO BIG formatValueCalls 213 exceeded limit of 200],
     [TOO BIG formatValueCalls 214 exceeded limit of 200],
     [TOO BIG formatValueCalls 215 exceeded limit of 200],
     [TOO BIG formatValueCalls 216 exceeded limit of 200],
     [TOO BIG formatValueCalls 217 exceeded limit of 200],
     [TOO BIG formatValueCalls 218 exceeded limit of 200],
     [TOO BIG formatValueCalls 219 exceeded limit of 200],
     [TOO BIG formatValueCalls 220 exceeded limit of 200],
     [TOO BIG formatValueCalls 221 exceeded limit of 200],
     [TOO BIG formatValueCalls 222 exceeded limit of 200],
     [TOO BIG formatValueCalls 223 exceeded limit of 200],
     [TOO BIG formatValueCalls 224 exceeded limit of 200],
     [TOO BIG formatValueCalls 225 exceeded limit of 200],
     [TOO BIG formatValueCalls 226 exceeded limit of 200],
     [TOO BIG formatValueCalls 227 exceeded limit of 200],
     [TOO BIG formatValueCalls 228 exceeded limit of 200],
     [TOO BIG formatValueCalls 229 exceeded limit of 200],
     [TOO BIG formatValueCalls 230 exceeded limit of 200],
     [TOO BIG formatValueCalls 231 exceeded limit of 200],
     [TOO BIG formatValueCalls 232 exceeded limit of 200],
     [TOO BIG formatValueCalls 233 exceeded limit of 200],
     [TOO BIG formatValueCalls 234 exceeded limit of 200],
     [TOO BIG formatValueCalls 235 exceeded limit of 200],
     [TOO BIG formatValueCalls 236 exceeded limit of 200],
     [TOO BIG formatValueCalls 237 exceeded limit of 200],
     [TOO BIG formatValueCalls 238 exceeded limit of 200],
     [TOO BIG formatValueCalls 239 exceeded limit of 200],
     [TOO BIG formatValueCalls 240 exceeded limit of 200],
     [TOO BIG formatValueCalls 241 exceeded limit of 200],
     [TOO BIG formatValueCalls 242 exceeded limit of 200],
     [TOO BIG formatValueCalls 243 exceeded limit of 200],
     [TOO BIG formatValueCalls 244 exceeded limit of 200],
     [TOO BIG formatValueCalls 245 exceeded limit of 200],
     [TOO BIG formatValueCalls 246 exceeded limit of 200],
     [TOO BIG formatValueCalls 247 exceeded limit of 200],
     [TOO BIG formatValueCalls 248 exceeded limit of 200],
     [TOO BIG formatValueCalls 249 exceeded limit of 200],
     [TOO BIG formatValueCalls 250 exceeded limit of 200],
     [TOO BIG formatValueCalls 251 exceeded limit of 200],
     [TOO BIG formatValueCalls 252 exceeded limit of 200],
     [TOO BIG formatValueCalls 253 exceeded limit of 200],
     [TOO BIG formatValueCalls 254 exceeded limit of 200],
     [TOO BIG formatValueCalls 255 exceeded limit of 200],
     [TOO BIG formatValueCalls 256 exceeded limit of 200],
     [TOO BIG formatValueCalls 257 exceeded limit of 200],
     [TOO BIG formatValueCalls 258 exceeded limit of 200],
     [TOO BIG formatValueCalls 259 exceeded limit of 200],
     [TOO BIG formatValueCalls 260 exceeded limit of 200],
     [TOO BIG formatValueCalls 261 exceeded limit of 200],
     [TOO BIG formatValueCalls 262 exceeded limit of 200],
     [TOO BIG formatValueCalls 263 exceeded limit of 200],
     [TOO BIG formatValueCalls 264 exceeded limit of 200],
     [TOO BIG formatValueCalls 265 exceeded limit of 200],
     [TOO BIG formatValueCalls 266 exceeded limit of 200],
     [TOO BIG formatValueCalls 267 exceeded limit of 200],
     [TOO BIG formatValueCalls 268 exceeded limit of 200],
     [TOO BIG formatValueCalls 269 exceeded limit of 200],
     [TOO BIG formatValueCalls 270 exceeded limit of 200],
     [TOO BIG formatValueCalls 271 exceeded limit of 200],
     [TOO BIG formatValueCalls 272 exceeded limit of 200],
     [TOO BIG formatValueCalls 273 exceeded limit of 200],
     [TOO BIG formatValueCalls 274 exceeded limit of 200],
     [TOO BIG formatValueCalls 275 exceeded limit of 200],
     [TOO BIG formatValueCalls 276 exceeded limit of 200],
     [TOO BIG formatValueCalls 277 exceeded limit of 200],
     [TOO BIG formatValueCalls 278 exceeded limit of 200],
     [TOO BIG formatValueCalls 279 exceeded limit of 200],
     [TOO BIG formatValueCalls 280 exceeded limit of 200],
     [TOO BIG formatValueCalls 281 exceeded limit of 200],
     [TOO BIG formatValueCalls 282 exceeded limit of 200],
     [TOO BIG formatValueCalls 283 exceeded limit of 200],
     [TOO BIG formatValueCalls 284 exceeded limit of 200],
     [TOO BIG formatValueCalls 285 exceeded limit of 200],
     [TOO BIG formatValueCalls 286 exceeded limit of 200],
     [TOO BIG formatValueCalls 287 exceeded limit of 200],
     [TOO BIG formatValueCalls 288 exceeded limit of 200],
     [TOO BIG formatValueCalls 289 exceeded limit of 200],
     [TOO BIG formatValueCalls 290 exceeded limit of 200],
     [TOO BIG formatValueCalls 291 exceeded limit of 200],
     [TOO BIG formatValueCalls 292 exceeded limit of 200],
     [TOO BIG formatValueCalls 293 exceeded limit of 200],
     [TOO BIG formatValueCalls 294 exceeded limit of 200],
     [TOO BIG formatValueCalls 295 exceeded limit of 200],
     [TOO BIG formatValueCalls 296 exceeded limit of 200],
     [TOO BIG formatValueCalls 297 exceeded limit of 200],
     [TOO BIG formatValueCalls 298 exceeded limit of 200],
     [TOO BIG formatValueCalls 299 exceeded limit of 200],
     [TOO BIG formatValueCalls 300 exceeded limit of 200],
     [TOO BIG formatValueCalls 301 exceeded limit of 200],
     [TOO BIG formatValueCalls 302 exceeded limit of 200],
     [TOO BIG formatValueCalls 303 exceeded limit of 200],
     [TOO BIG formatValueCalls 304 exceeded limit of 200],
     [TOO BIG formatValueCalls 305 exceeded limit of 200],
     [TOO BIG formatValueCalls 306 exceeded limit of 200],
     [TOO BIG formatValueCalls 307 exceeded limit of 200],
     [TOO BIG formatValueCalls 308 exceeded limit of 200],
     [TOO BIG formatValueCalls 309 exceeded limit of 200],
     [TOO BIG formatValueCalls 310 exceeded limit of 200],
     [TOO BIG formatValueCalls 311 exceeded limit of 200],
     [TOO BIG formatValueCalls 312 exceeded limit of 200],
     [TOO BIG formatValueCalls 313 exceeded limit of 200],
     [TOO BIG formatValueCalls 314 exceeded limit of 200],
     [TOO BIG formatValueCalls 315 exceeded limit of 200],
     [TOO BIG formatValueCalls 316 exceeded limit of 200],
     [TOO BIG formatValueCalls 317 exceeded limit of 200],
     [TOO BIG formatValueCalls 318 exceeded limit of 200],
     [TOO BIG formatValueCalls 319 exceeded limit of 200],
     [TOO BIG formatValueCalls 320 exceeded limit of 200],
     [TOO BIG formatValueCalls 321 exceeded limit of 200],
     [TOO BIG formatValueCalls 322 exceeded limit of 200],
     [TOO BIG formatValueCalls 323 exceeded limit of 200],
     [TOO BIG formatValueCalls 324 exceeded limit of 200],
     [TOO BIG formatValueCalls 325 exceeded limit of 200],
     [TOO BIG formatValueCalls 326 exceeded limit of 200],
     [TOO BIG formatValueCalls 327 exceeded limit of 200],
     [TOO BIG formatValueCalls 328 exceeded limit of 200],
     [TOO BIG formatValueCalls 329 exceeded limit of 200],
     [TOO BIG formatValueCalls 330 exceeded limit of 200],
     [TOO BIG formatValueCalls 331 exceeded limit of 200],
     [TOO BIG formatValueCalls 332 exceeded limit of 200],
     [TOO BIG formatValueCalls 333 exceeded limit of 200],
     [TOO BIG formatValueCalls 334 exceeded limit of 200],
     [TOO BIG formatValueCalls 335 exceeded limit of 200],
     [TOO BIG formatValueCalls 336 exceeded limit of 200],
     [TOO BIG formatValueCalls 337 exceeded limit of 200],
     [TOO BIG formatValueCalls 338 exceeded limit of 200],
     [TOO BIG formatValueCalls 339 exceeded limit of 200],
     [TOO BIG formatValueCalls 340 exceeded limit of 200],
     [TOO BIG formatValueCalls 341 exceeded limit of 200],
     [TOO BIG formatValueCalls 342 exceeded limit of 200],
     [TOO BIG formatValueCalls 343 exceeded limit of 200],
     [TOO BIG formatValueCalls 344 exceeded limit of 200],
     [TOO BIG formatValueCalls 345 exceeded limit of 200],
     [TOO BIG formatValueCalls 346 exceeded limit of 200],
     [TOO BIG formatValueCalls 347 exceeded limit of 200],
     [TOO BIG formatValueCalls 348 exceeded limit of 200],
     [TOO BIG formatValueCalls 349 exceeded limit of 200],
     [TOO BIG formatValueCalls 350 exceeded limit of 200],
     [TOO BIG formatValueCalls 351 exceeded limit of 200],
     [TOO BIG formatValueCalls 352 exceeded limit of 200],
     [TOO BIG formatValueCalls 353 exceeded limit of 200],
     [TOO BIG formatValueCalls 354 exceeded limit of 200],
     [TOO BIG formatValueCalls 355 exceeded limit of 200],
     [TOO BIG formatValueCalls 356 exceeded limit of 200],
     [TOO BIG formatValueCalls 357 exceeded limit of 200],
     [TOO BIG formatValueCalls 358 exceeded limit of 200],
     [TOO BIG formatValueCalls 359 exceeded limit of 200],
     [TOO BIG formatValueCalls 360 exceeded limit of 200],
     [TOO BIG formatValueCalls 361 exceeded limit of 200],
     [TOO BIG formatValueCalls 362 exceeded limit of 200],
     [TOO BIG formatValueCalls 363 exceeded limit of 200],
     [TOO BIG formatValueCalls 364 exceeded limit of 200],
     [TOO BIG formatValueCalls 365 exceeded limit of 200],
     [TOO BIG formatValueCalls 366 exceeded limit of 200],
     [TOO BIG formatValueCalls 367 exceeded limit of 200],
     [TOO BIG formatValueCalls 368 exceeded limit of 200],
     [TOO BIG formatValueCalls 369 exceeded limit of 200],
     [TOO BIG formatValueCalls 370 exceeded limit of 200],
     [TOO BIG formatValueCalls 371 exceeded limit of 200],
     [TOO BIG formatValueCalls 372 exceeded limit of 200],
     [TOO BIG formatValueCalls 373 exceeded limit of 200],
     [TOO BIG formatValueCalls 374 exceeded limit of 200],
     [TOO BIG formatValueCalls 375 exceeded limit of 200],
     [TOO BIG formatValueCalls 376 exceeded limit of 200],
     [TOO BIG formatValueCalls 377 exceeded limit of 200],
     [TOO BIG formatValueCalls 378 exceeded limit of 200],
     [TOO BIG formatValueCalls 379 exceeded limit of 200],
     [TOO BIG formatValueCalls 380 exceeded limit of 200],
     [TOO BIG formatValueCalls 381 exceeded limit of 200],
     [TOO BIG formatValueCalls 382 exceeded limit of 200],
     [TOO BIG formatValueCalls 383 exceeded limit of 200],
     [TOO BIG formatValueCalls 384 exceeded limit of 200],
     [TOO BIG formatValueCalls 385 exceeded limit of 200],
     [TOO BIG formatValueCalls 386 exceeded limit of 200],
     [TOO BIG formatValueCalls 387 exceeded limit of 200],
     [TOO BIG formatValueCalls 388 exceeded limit of 200],
     [TOO BIG formatValueCalls 389 exceeded limit of 200],
     [TOO BIG formatValueCalls 390 exceeded limit of 200],
     [TOO BIG formatValueCalls 391 exceeded limit of 200],
     [TOO BIG formatValueCalls 392 exceeded limit of 200],
     [TOO BIG formatValueCalls 393 exceeded limit of 200],
     [TOO BIG formatValueCalls 394 exceeded limit of 200],
     [TOO BIG formatValueCalls 395 exceeded limit of 200],
     [TOO BIG formatValueCalls 396 exceeded limit of 200],
     [TOO BIG formatValueCalls 397 exceeded limit of 200],
     [TOO BIG formatValueCalls 398 exceeded limit of 200],
     [TOO BIG formatValueCalls 399 exceeded limit of 200],
     [TOO BIG formatValueCalls 400 exceeded limit of 200],
     [TOO BIG formatValueCalls 401 exceeded limit of 200],
     [TOO BIG formatValueCalls 402 exceeded limit of 200],
     [TOO BIG formatValueCalls 403 exceeded limit of 200],
     [TOO BIG formatValueCalls 404 exceeded limit of 200],
     [TOO BIG formatValueCalls 405 exceeded limit of 200],
     [TOO BIG formatValueCalls 406 exceeded limit of 200],
     [TOO BIG formatValueCalls 407 exceeded limit of 200],
     [TOO BIG formatValueCalls 408 exceeded limit of 200],
     [TOO BIG formatValueCalls 409 exceeded limit of 200],
     [TOO BIG formatValueCalls 410 exceeded limit of 200],
     [TOO BIG formatValueCalls 411 exceeded limit of 200],
     [TOO BIG formatValueCalls 412 exceeded limit of 200],
     [TOO BIG formatValueCalls 413 exceeded limit of 200],
     [TOO BIG formatValueCalls 414 exceeded limit of 200],
     [TOO BIG formatValueCalls 415 exceeded limit of 200],
     [TOO BIG formatValueCalls 416 exceeded limit of 200],
     [TOO BIG formatValueCalls 417 exceeded limit of 200],
     [TOO BIG formatValueCalls 418 exceeded limit of 200],
     [TOO BIG formatValueCalls 419 exceeded limit of 200],
     [TOO BIG formatValueCalls 420 exceeded limit of 200],
     [TOO BIG formatValueCalls 421 exceeded limit of 200],
     [TOO BIG formatValueCalls 422 exceeded limit of 200],
     [TOO BIG formatValueCalls 423 exceeded limit of 200],
     [TOO BIG formatValueCalls 424 exceeded limit of 200],
     [TOO BIG formatValueCalls 425 exceeded limit of 200],
     [TOO BIG formatValueCalls 426 exceeded limit of 200],
     [TOO BIG formatValueCalls 427 exceeded limit of 200],
     [TOO BIG formatValueCalls 428 exceeded limit of 200],
     [TOO BIG formatValueCalls 429 exceeded limit of 200],
     [TOO BIG formatValueCalls 430 exceeded limit of 200],
     [TOO BIG formatValueCalls 431 exceeded limit of 200],
     [TOO BIG formatValueCalls 432 exceeded limit of 200],
     [TOO BIG formatValueCalls 433 exceeded limit of 200],
     [TOO BIG formatValueCalls 434 exceeded limit of 200],
     [TOO BIG formatValueCalls 435 exceeded limit of 200],
     [TOO BIG formatValueCalls 436 exceeded limit of 200],
     [TOO BIG formatValueCalls 437 exceeded limit of 200],
     [TOO BIG formatValueCalls 438 exceeded limit of 200],
     [TOO BIG formatValueCalls 439 exceeded limit of 200],
     [TOO BIG formatValueCalls 440 exceeded limit of 200],
     [TOO BIG formatValueCalls 441 exceeded limit of 200],
     [TOO BIG formatValueCalls 442 exceeded limit of 200],
     [TOO BIG formatValueCalls 443 exceeded limit of 200],
     [TOO BIG formatValueCalls 444 exceeded limit of 200],
     [TOO BIG formatValueCalls 445 exceeded limit of 200],
     [TOO BIG formatValueCalls 446 exceeded limit of 200],
     [TOO BIG formatValueCalls 447 exceeded limit of 200],
     [TOO BIG formatValueCalls 448 exceeded limit of 200],
     [TOO BIG formatValueCalls 449 exceeded limit of 200],
     [TOO BIG formatValueCalls 450 exceeded limit of 200],
     [TOO BIG formatValueCalls 451 exceeded limit of 200],
     [TOO BIG formatValueCalls 452 exceeded limit of 200],
     [TOO BIG formatValueCalls 453 exceeded limit of 200],
     [TOO BIG formatValueCalls 454 exceeded limit of 200],
     [TOO BIG formatValueCalls 455 exceeded limit of 200],
     [TOO BIG formatValueCalls 456 exceeded limit of 200] ],
  routes: [TOO BIG formatValueCalls 457 exceeded limit of 200] }
nw_path_necp_check_for_updates Failed to copy updated result (22)
nw_socket_handle_socket_event [C922:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C923:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C922 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C923 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 922: received failure notification
Connection 922: failed to connect 1:61, reason -1
Connection 922: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C922] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C922] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 923: received failure notification
Connection 923: failed to connect 1:61, reason -1
Connection 923: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C923] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C923] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <EA1039C9-D7B7-45FA-9636-976CCE0EAF99>.<106> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <B68707E3-64A0-4B1B-B939-0E67AB8755C1>.<107> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <EA1039C9-D7B7-45FA-9636-976CCE0EAF99>.<106> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x302339830 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <EA1039C9-D7B7-45FA-9636-976CCE0EAF99>.<106>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <EA1039C9-D7B7-45FA-9636-976CCE0EAF99>.<106>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_socket_handle_socket_event [C924:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C925:2] Socket SO_ERROR [61: Connection refused]
Task <B68707E3-64A0-4B1B-B939-0E67AB8755C1>.<107> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x30233a820 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <B68707E3-64A0-4B1B-B939-0E67AB8755C1>.<107>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <B68707E3-64A0-4B1B-B939-0E67AB8755C1>.<107>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_endpoint_flow_failed_with_error [C924 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C925 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 924: received failure notification
Connection 924: failed to connect 1:61, reason -1
Connection 924: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C924] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C924] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 925: received failure notification
Connection 925: failed to connect 1:61, reason -1
Connection 925: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C925] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C925] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <A301B86A-6279-4156-83D3-4906C1BF59B4>.<109> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
nw_socket_handle_socket_event [C926:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C927:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C928:2] Socket SO_ERROR [61: Connection refused]
Task <A301B86A-6279-4156-83D3-4906C1BF59B4>.<109> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc5710 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <A301B86A-6279-4156-83D3-4906C1BF59B4>.<109>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <A301B86A-6279-4156-83D3-4906C1BF59B4>.<109>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <CB32EFE7-2C18-429A-AC88-2DE28C095B6E>.<108> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
nw_endpoint_flow_failed_with_error [C926 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C927 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C928 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C929:2] Socket SO_ERROR [61: Connection refused]
Task <CB32EFE7-2C18-429A-AC88-2DE28C095B6E>.<108> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cac9f0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <CB32EFE7-2C18-429A-AC88-2DE28C095B6E>.<108>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <CB32EFE7-2C18-429A-AC88-2DE28C095B6E>.<108>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Connection 926: received failure notification
Connection 926: failed to connect 1:61, reason -1
Connection 926: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C926] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C926] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 927: received failure notification
Connection 927: failed to connect 1:61, reason -1
Connection 927: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C927] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C927] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 928: received failure notification
Connection 928: failed to connect 1:61, reason -1
Connection 928: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C928] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C928] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
nw_endpoint_flow_failed_with_error [C929 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C930:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C931:2] Socket SO_ERROR [61: Connection refused]
Task <7074C7CB-F5F8-4617-9D06-EF644FCF3860>.<110> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <CEF34108-0AC7-43C7-B6BC-910436C358C0>.<111> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <112B5B4E-0A93-4F89-86B2-597F52CEE6D8>.<113> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Connection 929: received failure notification
Connection 929: failed to connect 1:61, reason -1
Connection 929: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C929] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C929] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
nw_endpoint_flow_failed_with_error [C930 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C931 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Task <7074C7CB-F5F8-4617-9D06-EF644FCF3860>.<110> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303c85200 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <7074C7CB-F5F8-4617-9D06-EF644FCF3860>.<110>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <7074C7CB-F5F8-4617-9D06-EF644FCF3860>.<110>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <CEF34108-0AC7-43C7-B6BC-910436C358C0>.<111> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc0630 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <CEF34108-0AC7-43C7-B6BC-910436C358C0>.<111>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <CEF34108-0AC7-43C7-B6BC-910436C358C0>.<111>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <112B5B4E-0A93-4F89-86B2-597F52CEE6D8>.<113> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc0180 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <112B5B4E-0A93-4F89-86B2-597F52CEE6D8>.<113>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <112B5B4E-0A93-4F89-86B2-597F52CEE6D8>.<113>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Connection 930: received failure notification
Connection 930: failed to connect 1:61, reason -1
Connection 930: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C930] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C930] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 931: received failure notification
Connection 931: failed to connect 1:61, reason -1
Connection 931: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C931] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C931] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <AC8380BA-D545-4209-948F-060D43B4860F>.<112> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <3AF3C596-98FA-42C6-ABAB-502D6986671A>.<114> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <5E870071-35BA-490D-A953-6E9CEA579D33>.<115> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
nw_socket_handle_socket_event [C932:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C933:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C932 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Task <AC8380BA-D545-4209-948F-060D43B4860F>.<112> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc0d80 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <AC8380BA-D545-4209-948F-060D43B4860F>.<112>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <AC8380BA-D545-4209-948F-060D43B4860F>.<112>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_endpoint_flow_failed_with_error [C933 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Task <3AF3C596-98FA-42C6-ABAB-502D6986671A>.<114> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc3f60 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <3AF3C596-98FA-42C6-ABAB-502D6986671A>.<114>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <3AF3C596-98FA-42C6-ABAB-502D6986671A>.<114>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <5E870071-35BA-490D-A953-6E9CEA579D33>.<115> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc0780 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <5E870071-35BA-490D-A953-6E9CEA579D33>.<115>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <5E870071-35BA-490D-A953-6E9CEA579D33>.<115>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Connection 932: received failure notification
Connection 932: failed to connect 1:61, reason -1
Connection 932: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C932] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C932] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 933: received failure notification
Connection 933: failed to connect 1:61, reason -1
Connection 933: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C933] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C933] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <E4C851B7-AF44-47E0-B677-32067683B900>.<116> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <BEC92FA8-5BB1-4DB5-88E9-4B53024633B4>.<117> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <E4C851B7-AF44-47E0-B677-32067683B900>.<116> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc2bb0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <E4C851B7-AF44-47E0-B677-32067683B900>.<116>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <E4C851B7-AF44-47E0-B677-32067683B900>.<116>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <BEC92FA8-5BB1-4DB5-88E9-4B53024633B4>.<117> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303cc0420 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <BEC92FA8-5BB1-4DB5-88E9-4B53024633B4>.<117>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <BEC92FA8-5BB1-4DB5-88E9-4B53024633B4>.<117>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
'~~~variant', 'call-filled'
Unrecognized font family 'Geist SemiBold Regular'
Unrecognized font family 'Geist Regular'
Error setting property 'pointerEvents' of RNSScreenStackHeaderConfig with tag #16495: UIView base class does not support pointerEvent value: box-none
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
nw_socket_handle_socket_event [C934.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C934.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C934.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C934.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C934.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C934] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300730780 Failed : error 0:61 [61]
'🚀 ~ PopinBridgeClass ~ params:', { token: '51940',
  hubCode: '',
  orderId: 'AP9B7J',
  callMetaData: 
   { callerId: 'Cars24 Customer',
     product: 
      { id: '4450501923',
        url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923',
        image: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format',
        registrationNumber: 'DL01**0014',
        name: '2014 Toyota Innova',
        description: 'Diesel | Automatic | 69958 km | 3.20 lakh' },
     videoCallUrl: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}',
     callEndRedirectionUrl: 'pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK',
     businessUnit: 'BUY',
     journey: 'VIDEO_TEST_DRIVE',
     tenantId: 'INDIA_VIDEO_PLATFORM',
     orderId: 'AP9B7J',
     serviceRequestId: 'AP9B7J-SR-1',
     vehicleId: '4450501923',
     uniqueSessionId: '{{x_unique_session_id}}',
     userId: '55e2c318-e242-45d3-aead-30dce37e3fd5' },
  userName: 'Customer name',
  sandboxMode: true }
🎥 [PopinModule] updateCallContext called
🎥 [PopinHelper] updateCallContext() called with config: {
    callerId = AP9B7J;
    meta =     {
        businessUnit = BUY;
        callEndRedirectionUrl = "pulse://?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK";
        callerId = "Cars24 Customer";
        hubCode = "";
        journey = "VIDEO_TEST_DRIVE";
        orderId = AP9B7J;
        scheduleId = "";
        serviceRequestId = "AP9B7J-SR-1";
        source = app;
        tenantId = "INDIA_VIDEO_PLATFORM";
        uniqueSessionId = "{{x_unique_session_id}}";
        userId = "55e2c318-e242-45d3-aead-30dce37e3fd5";
        vehicleId = 4450501923;
        videoCallUrl = "https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923/checkout/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}";
    };
    product =     {
        description = "Diesel | Automatic | 69958 km | 3.20 lakh";
        id = 4450501923;
        image = "https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format";
        name = "2014 Toyota Innova";
        registrationNumber = "DL01**0014";
        url = "https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923";
    };
}
🎥 [PopinHelper] ✅ updateCallContext() completed
🎥 [PopinBridge] updated_runtime_context -> startCall
🎥 [PopinHelper] startCall() called
🎥 [PopinHelper] Events listener already registered during initialize()
🎥 [PopinHelper] ✅ Popin.shared exists
[Popin] startCall() called, pusherConnected=false
🎥 [PopinHelper] ✅ startCall() completed
[Popin] PermissionService: mic=granted, camera=true
'🎥 [VideoCallHandler] Result:', true
🎥 [PopinEventsListener] ✅ onPermissionGiven | eventEmitter: EXISTS
🎥 [PopinModule] sendEvent via DeviceEventEmitter: onPermissionGranted
'~~~handledNatively', true
🎥 [PopinModule] ✅ Event sent: onPermissionGranted
[Popin] CallOrchestrator.startCall()
[Popin] CallUICoordinator.presentOutgoingCallVC
[Popin] CallUICoordinator.buildCallVC: isOutgoing=true, hideFlipCameraButton=true
'🎧 [PopinBridge] Raw event data received:', 'onPermissionGranted', '{}'
'🎥 [VideoCallHandler] Event:', 'onPermissionGranted', ''
'🎥 [Superapp] Video call event:', 'onPermissionGranted', ''
[Popin] CallUICoordinator.presentCallVCFromRoot: Presenting directly
[Popin] API Request: POST https://widget01.popin-sandbox.com/api/v1/user/call/start
[Popin] API Parameters: ["seller_id": 51940, "campaign": "{\"product\":\"{\\\"image\\\":\\\"https:\\\\\\/\\\\\\/media.cars24.com\\\\\\/hello-ar\\\\\\/dev\\\\\\/uploads\\\\\\/no_bg\\\\\\/c55bd976-0ed0-11ef-bd33-02ede2007fbe\\\\\\/663e1f143a24b0d05144ec17\\\\\\/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7\\\\\\/slot\\\\\\/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format\\\",\\\"id\\\":\\\"4450501923\\\",\\\"description\\\":\\\"Diesel | Automatic | 69958 km | 3.20 lakh\\\",\\\"url\\\":\\\"https:\\\\\\/\\\\\\/stage-catalog-india-website.qac24svc.dev\\\\\\/buy-used-toyota-innova-2014-cars-gurgaon-4450501923\\\",\\\"registrationNumber\\\":\\\"DL01**0014\\\",\\\"name\\\":\\\"2014 Toyota Innova\\\"}\",\"source\":\"app\",\"orderId\":\"AP9B7J\",\"uniqueSessionId\":\"{{x_unique_session_id}}\",\"userId\":\"55e2c318-e242-45d3-aead-30dce37e3fd5\",\"journey\":\"VIDEO_TEST_DRIVE\",\"callerId\":\"AP9B7J\",\"vehicleId\":\"4450501923\",\"serviceRequestId\":\"AP9B7J-SR-1\",\"scheduleId\":\"\",\"businessUnit\":\"BUY\",\"tenantId\":\"INDIA_VIDEO_PLATFORM\",\"videoCallUrl\":\"https:\\/\\/stage-catalog-india-website.qac24svc.dev\\/buy-used-toyota-innova-2014-cars-gurgaon-4450501923\\/checkout\\/video-test-drive?orderId=AP9B7J&appointmentId=4450501923&allowRedirect=true&videoTestDrive=true&umsAuthCode=~{umsAuthCodeQuery}\",\"callEndRedirectionUrl\":\"pulse:\\/\\/?path=customer-feedback?orderId=AP9B7J&serviceRequestId=AP9B7J-SR-1&type=VIDEO_VISIT_FEEDBACK\",\"hubCode\":\"\"}"]
[Popin] PopinCallVC.setupSwiftUIView: popinConfig.hideFlipCameraButton=true, isOutgoingCall=true
nw_socket_handle_socket_event [C936:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C936 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 936: received failure notification
Connection 936: failed to connect 1:61, reason -1
Connection 936: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C936] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C936] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
nw_socket_handle_socket_event [C937:2] Socket SO_ERROR [61: Connection refused]
Task <7B3E6A83-2504-462C-859F-F3D49DD601FB>.<118> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <7B3E6A83-2504-462C-859F-F3D49DD601FB>.<118> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303f41aa0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <7B3E6A83-2504-462C-859F-F3D49DD601FB>.<118>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <7B3E6A83-2504-462C-859F-F3D49DD601FB>.<118>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_endpoint_flow_failed_with_error [C937 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 937: received failure notification
Connection 937: failed to connect 1:61, reason -1
Connection 937: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C937] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C937] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <FA6AEE7B-1C7D-4EF7-9CE5-FEA837A6E049>.<119> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
nw_socket_handle_socket_event [C939:2] Socket SO_ERROR [61: Connection refused]
Task <FA6AEE7B-1C7D-4EF7-9CE5-FEA837A6E049>.<119> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303c984e0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <FA6AEE7B-1C7D-4EF7-9CE5-FEA837A6E049>.<119>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <FA6AEE7B-1C7D-4EF7-9CE5-FEA837A6E049>.<119>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_endpoint_flow_failed_with_error [C939 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 939: received failure notification
Connection 939: failed to connect 1:61, reason -1
Connection 939: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C939] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C939] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <BBC07980-19CC-4E83-8AB9-42413C8780DE>.<120> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <BBC07980-19CC-4E83-8AB9-42413C8780DE>.<120> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x303f9a100 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <BBC07980-19CC-4E83-8AB9-42413C8780DE>.<120>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <BBC07980-19CC-4E83-8AB9-42413C8780DE>.<120>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
LOGIN SDK:: Starting token refresh
'LOGIN SDK:: %cinfo: Automatic token refresh initiated due to 401', 'color: blue', { url: 'https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS',
  method: 'get' }
'LOGIN SDK:: %cinfo: Attempting to refresh access token', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: request headers', { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
  method: 'post',
  data: 
   { grant_type: 'refresh_token',
     refresh_token: 'ory_rt_gGdUDAniQB0KxcNx7OY6cevCx2MDCvhoGK1D8494nFY.MbUYF9USsvAP0pTGpGFAX91T2ggPlr-lFwJxJCdFyYA',
     client_id: 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
     redirect_uri: 'cars24://oauth' },
  headers: 
   { common: { Accept: 'application/json, text/plain, */*' },
     delete: {},
     get: {},
     head: {},
     post: { 'Content-Type': 'application/x-www-form-urlencoded' },
     put: { 'Content-Type': 'application/x-www-form-urlencoded' },
     patch: { 'Content-Type': 'application/x-www-form-urlencoded' },
     osName: 'ios',
     mediaSource: 'HELLO_AR',
     source: 'mobile',
     SOURCE: 'MobileApp',
     'Content-Type': 'application/json',
     'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99' },
  transformRequest: [ [Function: transformRequest] ],
  transformResponse: [ [Function: transformResponse] ],
  timeout: 0,
  withCredentials: true,
  adapter: [Function: xhrAdapter],
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-XSRF-TOKEN',
  maxContentLength: -1,
  maxBodyLength: -1,
  validateStatus: [Function: validateStatus],
  transitional: 
   { silentJSONParsing: true,
     forcedJSONParsing: true,
     clarifyTimeoutError: false } }
'LOGIN SDK:: RESPONSE', { data: 
   { success: true,
     message: 'Token data',
     data: 
      { access_token: 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNSwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNCwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjczZmRlNmI0LWYzZTMtNGQ3NC1iMDk4LTZmNzliY2MwZThkNiIsIm5iZiI6MTc3MzEzMTYyNCwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.rTdfnXO-TOsBBzNLbnbq_BaxsKW23i9AH2Xqdt9Fde6UKj2Y-f08vOx5a4N6sAz8PC-0qbkfcyJCp1tKMCoznA',
        session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
        token_type: 'bearer',

        expires_in: 900,
        refresh_token: 'ory_rt_hwuCEAlKrenc4wuZzrDFBb3TjHUK5R-cD_Ft3TYXAxM.O7JSeMEFTqioMah7yi287tZtnevLVBysTvTpMp-cM4I',
        refresh_token_expiry_in: 86400 } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9ed6e989cd7-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json; charset=utf-8',
     date: 'Tue, 10 Mar 2026 08:33:44 GMT',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=L5BDQcmyK6nqDYvpkyeH6uQB4g9ZIiz1MkMnja2uEYE-1773131624-1.0.1.1-alRXe3lf3CeYjEZgAzIwiZq2WP9klGNXAPLH3fk2XvVPD8ASHwR3MslbmIBEVuKUMBF_pBtx_hF2j7QkNyRtfJKnTVqh7oR3.39Boz45K_k; path=/; expires=Tue, 10-Mar-26 09:03:44 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ] },
  config: 
   { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     method: 'post',
     data: '{"grant_type":"refresh_token","refresh_token":"ory_rt_gGdUDAniQB0KxcNx7OY6cevCx2MDCvhoGK1D8494nFY.MbUYF9USsvAP0pTGpGFAX91T2ggPlr-lFwJxJCdFyYA","client_id":"client_3L2Q2B-DFrgi2JiZYJAhRw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","redirect_uri":"cars24://oauth"}',
     headers: 
      { Accept: 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        source: 'mobile',
        SOURCE: 'MobileApp',
        'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
        'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        x_experiment_id: '664f4f0a-bcef-4191-a756-8de0a5385529',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     withCredentials: true,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false } },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'POST',
     _perfKey: 'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token',
     _response: '{"success":true,"message":"Token data","data":{"access_token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNSwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNCwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjczZmRlNmI0LWYzZTMtNGQ3NC1iMDk4LTZmNzliY2MwZThkNiIsIm5iZiI6MTc3MzEzMTYyNCwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.rTdfnXO-TOsBBzNLbnbq_BaxsKW23i9AH2Xqdt9Fde6UKj2Y-f08vOx5a4N6sAz8PC-0qbkfcyJCp1tKMCoznA","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","token_type":"bearer","expires_in":900,"refresh_token":"ory_rt_hwuCEAlKrenc4wuZzrDFBb3TjHUK5R-cD_Ft3TYXAxM.O7JSeMEFTqioMah7yi287tZtnevLVBysTvTpMp-cM4I","refresh_token_expiry_in":86400}}',
     _url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185370794.309458,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.06475,
              totalTime: 1956.4894999861717 },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': { startTime: 183726569.826833, startExtras: undefined },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': 
            { startTime: 183726570.926458,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728507.258666,
              totalTime: 1936.332208007574 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183727596.36275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728556.613333,
              totalTime: 960.2505829930305 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183728313.313083,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728822.613666,
              totalTime: 509.3005830049515 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': 
            { startTime: 183728473.771125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728913.473083,
              totalTime: 439.70195800065994 },
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': 
            { startTime: 183728474.696791,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728834.236166,
              totalTime: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 202 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS': [TOO BIG formatValueCalls 252 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 253 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 254 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 255 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 256 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 257 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 258 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 259 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 260 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 261 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 262 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 266 exceeded limit of 200] } }
'LOGIN SDK:: %cbreadcrumb: Storing authentication tokens', 'color: black', { hasPhoneNumber: false,
  sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
✅ Provider app saving tokens with ownership metadata: unknown
✅ Tokens synced to cross-app storage
'LOGIN SDK:: %cinfo: Tokens stored successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: %cinfo: Access token refreshed successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
LOGIN SDK:: Token refresh successful
'LOGIN SDK:: %cinfo: Automatic token refresh successful', 'color: blue', undefined
'LOGIN SDK:: RESPONSE', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',

             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',

             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],

     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS: 200', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },

             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',

                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],
     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
tcp_input [C878.1.1.1:3] flags=[R.] seq=893637400, ack=3962428922, win=517 state=LAST_ACK rcv_nxt=893637400, snd_una=3962428922
tcp_input [C878.1.1.1:3] flags=[R] seq=893637400, ack=0, win=0 state=CLOSED rcv_nxt=893637400, snd_una=3962428922
tcp_input [C878.1.1.1:3] flags=[R] seq=893637400, ack=0, win=0 state=CLOSED rcv_nxt=893637400, snd_una=3962428922
[Popin] API Response: 200 Popin Login
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS: 200', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],
     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
'fetchedConfig>>', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'existingConfig>>', null
~~~i m here 1
'~~~i m here 2', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'~~~i m here 3', 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED'
'configArray>>', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'configArray>>409', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'~~~videoTestDriveCompletedConfig', { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
  viewType: 'CONGRATS_LOADER',
  title: 'Successfully completed!',
  subtitle: 'Your video demo has been completed successfully!',
  bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
  bgGradient: [ '#016630', '#00A63E' ],
  media: 
   { type: 'ANIMATION',
     url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
     meta: { duration: 3000, loop: false } } }
[Popin] CallOrchestrator.startCall: API failed
🎥 [PopinEventsListener] ⚠️ onCallFailed
🎥 [PopinModule] sendEvent via DeviceEventEmitter: onCallFailed
🎥 [PopinModule] ✅ Event sent: onCallFailed
'🎧 [PopinBridge] Raw event data received:', 'onCallFailed', '{"error":"Call failed"}'
'🎥 [VideoCallHandler] Event:', 'onCallFailed', { error: 'Call failed' }
'🎥 [Superapp] Video call event:', 'onCallFailed', { error: 'Call failed' }
🎥 [VideoCallHandler] Terminal event - clearing listeners
🧹 PopinBridge: Clearing event listeners (SDK stays initialized)
nw_socket_handle_socket_event [C940:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C940 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 940: received failure notification
Connection 940: failed to connect 1:61, reason -1
Connection 940: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C940] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C940] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Task <5EFA6B19-3C02-4B62-A475-56EC7BF79C7C>.<124> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
nw_socket_handle_socket_event [C941:2] Socket SO_ERROR [61: Connection refused]
Task <5EFA6B19-3C02-4B62-A475-56EC7BF79C7C>.<124> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x3023341e0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <5EFA6B19-3C02-4B62-A475-56EC7BF79C7C>.<124>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <5EFA6B19-3C02-4B62-A475-56EC7BF79C7C>.<124>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
nw_socket_handle_socket_event [C942:2] Socket SO_ERROR [61: Connection refused]
nw_socket_handle_socket_event [C943:2] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C941 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C942 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C943 127.0.0.1:7242 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
Connection 941: received failure notification
Connection 941: failed to connect 1:61, reason -1
Connection 941: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C941] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C941] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 942: received failure notification
Connection 942: failed to connect 1:61, reason -1
Connection 942: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C942] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C942] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
Connection 943: received failure notification
Connection 943: failed to connect 1:61, reason -1
Connection 943: encountered error(1:61)
nw_connection_copy_connected_local_endpoint_block_invoke [C943] Client called nw_connection_copy_connected_local_endpoint on unconnected nw_connection
nw_connection_copy_connected_remote_endpoint_block_invoke [C943] Client called nw_connection_copy_connected_remote_endpoint on unconnected nw_connection
container_create_or_lookup_app_group_path_by_app_group_identifier: client is not entitled
Task <184223CA-0CC9-40AB-BBCA-57A7B4BE5926>.<125> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <92959920-5B0F-4988-AFB6-5216E5A0C4E9>.<126> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <7CDB1CB8-3125-4B66-9233-8C6810005A9E>.<128> HTTP load failed, 0/0 bytes (error code: -1004 [1:61])
Task <184223CA-0CC9-40AB-BBCA-57A7B4BE5926>.<125> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x302336bb0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <184223CA-0CC9-40AB-BBCA-57A7B4BE5926>.<125>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <184223CA-0CC9-40AB-BBCA-57A7B4BE5926>.<125>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <92959920-5B0F-4988-AFB6-5216E5A0C4E9>.<126> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x302334f90 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <92959920-5B0F-4988-AFB6-5216E5A0C4E9>.<126>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <92959920-5B0F-4988-AFB6-5216E5A0C4E9>.<126>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
Task <7CDB1CB8-3125-4B66-9233-8C6810005A9E>.<128> finished with error [-1004] Error Domain=NSURLErrorDomain Code=-1004 "Could not connect to the server." UserInfo={_kCFStreamErrorCodeKey=61, NSUnderlyingError=0x3023322e0 {Error Domain=kCFErrorDomainCFNetwork Code=-1004 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), viable, interface: lo0, _kCFStreamErrorCodeKey=61, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <7CDB1CB8-3125-4B66-9233-8C6810005A9E>.<128>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <7CDB1CB8-3125-4B66-9233-8C6810005A9E>.<128>"
), NSLocalizedDescription=Could not connect to the server., NSErrorFailingURLStringKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, NSErrorFailingURLKey=http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4, _kCFStreamErrorDomainKey=1}
[Popin] PopinCallVC: closeViewController: shouldNotEndCX=false, closedCall=false, callConnected=false
[Popin] CallManager: endCall failed: no currentCallUUID
[Popin] CallUICoordinator: onCallEnd fired (isOutgoing=true)
🎥 [PopinEventsListener] 📴 onCallEnd | eventEmitter: EXISTS
🎥 [PopinModule] sendEvent via DeviceEventEmitter: onCallEnded
🎥 [PopinModule] ✅ Event sent: onCallEnded
[Popin] Popin: call ended, state reset
[Popin] CallUICoordinator.cleanupAfterCallEnd: State reset complete
[Popin] WaitingPiP: cleanup — isPiPActive=false, isRestoring=false
CameraCapturer.init(delegate:options:processor:) isMultitaskingAccessSupported: true
LocalParticipant._publish(track:options:) [publish] LocalVideoTrack(sid: nil, name: camera, source: camera) options: nil...
LOGIN SDK:: Starting token refresh
'LOGIN SDK:: %cinfo: Automatic token refresh initiated due to 401', 'color: blue', { url: 'https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS',
  method: 'get' }
'LOGIN SDK:: %cinfo: Attempting to refresh access token', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: request headers', { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
  method: 'post',
  data: 
   { grant_type: 'refresh_token',
     refresh_token: 'ory_rt_hwuCEAlKrenc4wuZzrDFBb3TjHUK5R-cD_Ft3TYXAxM.O7JSeMEFTqioMah7yi287tZtnevLVBysTvTpMp-cM4I',
     client_id: 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
     redirect_uri: 'cars24://oauth' },
  headers: 
   { common: { Accept: 'application/json, text/plain, */*' },
     delete: {},
     get: {},
     head: {},
     post: { 'Content-Type': 'application/x-www-form-urlencoded' },
     put: { 'Content-Type': 'application/x-www-form-urlencoded' },
     patch: { 'Content-Type': 'application/x-www-form-urlencoded' },
     osName: 'ios',
     mediaSource: 'HELLO_AR',
     source: 'mobile',
     SOURCE: 'MobileApp',
     'Content-Type': 'application/json',
     'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99' },
  transformRequest: [ [Function: transformRequest] ],
  transformResponse: [ [Function: transformResponse] ],
  timeout: 0,
  withCredentials: true,
  adapter: [Function: xhrAdapter],
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-XSRF-TOKEN',
  maxContentLength: -1,
  maxBodyLength: -1,
  validateStatus: [Function: validateStatus],
  transitional: 
   { silentJSONParsing: true,
     forcedJSONParsing: true,
     clarifyTimeoutError: false } }
'LOGIN SDK:: RESPONSE', { data: 
   { success: true,
     message: 'Token data',
     data: 
      { access_token: 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNiwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNSwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6ImY0YzA2OGNlLTBmODgtNGRjYi1iYmJmLWYyOWMzYzk4YTU4YyIsIm5iZiI6MTc3MzEzMTYyNSwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.tZuyZQqv5P0BnDEO09hL6MKEDB-FpNNtdnrPMNGGaVBuNmbZ8NANMnNgG_kIxGqITG0NjA1OF4TqSLp_aifEHw',
        session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
        token_type: 'bearer',

        expires_in: 900,
        refresh_token: 'ory_rt_P7Fh5J3iVbF579D5qJVBU9ZFQBNQG39xAlFrESdSooo.UAxesOSh75ZC544enLJ_O1B9Epe83Kba6_ghIjCQeaU',
        refresh_token_expiry_in: 86400 } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9f3da029cd7-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json; charset=utf-8',
     date: 'Tue, 10 Mar 2026 08:33:45 GMT',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=jS2b4XECFLBgJD0cCclD19nJtRCao6JYDwbEf8593LI-1773131625-1.0.1.1-q41hwRHAXfyYs2wmTWrPILWoNi7gX4HeTHrzaZ1RsajLe7828xT8xzy3ZNI52EM_i7WE5GRcfsD_dAkpQzcgQWLOIryLHGn_fN6xA2tr7n8; path=/; expires=Tue, 10-Mar-26 09:03:45 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ] },
  config: 
   { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     method: 'post',
     data: '{"grant_type":"refresh_token","refresh_token":"ory_rt_hwuCEAlKrenc4wuZzrDFBb3TjHUK5R-cD_Ft3TYXAxM.O7JSeMEFTqioMah7yi287tZtnevLVBysTvTpMp-cM4I","client_id":"client_3L2Q2B-DFrgi2JiZYJAhRw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","redirect_uri":"cars24://oauth"}',
     headers: 
      { Accept: 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        source: 'mobile',
        SOURCE: 'MobileApp',
        'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
        'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        x_experiment_id: '664f4f0a-bcef-4191-a756-8de0a5385529',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     withCredentials: true,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false } },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'POST',
     _perfKey: 'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token',
     _response: '{"success":true,"message":"Token data","data":{"access_token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNiwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNSwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6ImY0YzA2OGNlLTBmODgtNGRjYi1iYmJmLWYyOWMzYzk4YTU4YyIsIm5iZiI6MTc3MzEzMTYyNSwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.tZuyZQqv5P0BnDEO09hL6MKEDB-FpNNtdnrPMNGGaVBuNmbZ8NANMnNgG_kIxGqITG0NjA1OF4TqSLp_aifEHw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","token_type":"bearer","expires_in":900,"refresh_token":"ory_rt_P7Fh5J3iVbF579D5qJVBU9ZFQBNQG39xAlFrESdSooo.UAxesOSh75ZC544enLJ_O1B9Epe83Kba6_ghIjCQeaU","refresh_token_expiry_in":86400}}',
     _url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185371824.699083,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.06475,
              totalTime: 1956.4894999861717 },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': { startTime: 183726569.826833, startExtras: undefined },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': 
            { startTime: 183726570.926458,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728507.258666,
              totalTime: 1936.332208007574 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183727596.36275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728556.613333,
              totalTime: 960.2505829930305 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183728313.313083,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728822.613666,
              totalTime: 509.3005830049515 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': 
            { startTime: 183728473.771125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728913.473083,
              totalTime: 439.70195800065994 },
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': 
            { startTime: 183728474.696791,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728834.236166,
              totalTime: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 202 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS': [TOO BIG formatValueCalls 252 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 253 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 254 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 255 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 256 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 257 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 258 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 259 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 260 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 261 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 262 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 266 exceeded limit of 200] } }
'LOGIN SDK:: %cbreadcrumb: Storing authentication tokens', 'color: black', { hasPhoneNumber: false,
  sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
✅ Provider app saving tokens with ownership metadata: unknown
✅ Tokens synced to cross-app storage
'LOGIN SDK:: %cinfo: Tokens stored successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: %cinfo: Access token refreshed successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
LOGIN SDK:: Token refresh successful
'LOGIN SDK:: %cinfo: Automatic token refresh successful', 'color: blue', undefined
'LOGIN SDK:: RESPONSE', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',

             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',

             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],

     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS: 200', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },

             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',

                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],
     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS: 200', { data: 
   { ruleType: 'CONFIRM_BOOKING_LOADERS',
     data: 
      { data: 
         [ { key: 'SUCCESS',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment is done!',
             subtitle: 'We’re redirecting you to the next page...',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'PENDING',
             viewType: 'PAYMENT_LOADER',
             title: 'We’re initiating your payment',
             subtitle: 'Please wait while we take you to the next page.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
           { key: 'FAILED',
             viewType: 'PAYMENT_LOADER',
             title: 'Your payment failed!',
             subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
                meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
             action: { type: 'RETRY', title: 'Retry payment' } },
           { key: 'CONGRATS_HUB',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_PAID_HOME_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             media: 
              { type: 'ANIMATION',
                url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your video demo has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_FREE_HUB_DELIVERY',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully booked!',
             subtitle: 'Your showroom test drive has been booked successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Successfully completed!',
             subtitle: 'Your video demo has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } },
           { key: 'APP_DOWNLOAD_NUDGE',
             viewType: 'CONGRATS_LOADER',
             title: 'Glad you enjoyed the test drive!',
             titleColor: '#0f0f10',
             subtitleColor: '#717272',
             subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },

             bottomMedia: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
             redirection: 
              { text: 'Download app',
                type: 'PRIMARY',
                action: 'DEEP_LINK',
                data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
             header: 
              { title: 'Test drive completed',
                leftIcon: 'arrow-left-outline',
                rightIcon: 'support-outline' } },
           { key: 'VIDEO_LINK_EXPIRED',
             viewType: 'CONGRATS_LOADER',
             title: 'Looks like you missed your slot!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: 
              { text: 'Reschedule',
                type: 'PRIMARY',

                action: 'DEEP_LINK',
                data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
             description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
           { key: 'USER_AUTHENTICATION_FAILED',
             viewType: 'CONGRATS_LOADER',
             title: 'Call booked on another number!',
             media: 
              { type: 'IMAGE',
                url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
             redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
             description: 'This video demo is for another number, please log in with a number you used to book it.' },
           { key: 'API_FAILURE_SCREEN',
             viewType: 'CONGRATS_LOADER',
             title: 'We missed that!',
             media: 
              { type: 'IMAGE',
                url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
             redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
             description: 'We couldn\'t process your request. Please try again in a moment.' },
           { key: 'PAYMENT_COMPLETED',
             viewType: 'CONGRATS_LOADER',
             title: 'Payment successful!',
             subtitle: 'Your token payment has been completed successfully!',
             bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
             bgGradient: [ '#016630', '#00A63E' ],
             media: 
              { type: 'ANIMATION',
                url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
                meta: { duration: 3000, loop: false } } } ] } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cache-control': 'no-cache, no-store, max-age=0, must-revalidate',
     'cf-cache-status': [TOO BIG formatValueCalls 201 exceeded limit of 200],
     'cf-ray': [TOO BIG formatValueCalls 202 exceeded limit of 200],
     'content-encoding': [TOO BIG formatValueCalls 203 exceeded limit of 200],
     'content-length': [TOO BIG formatValueCalls 204 exceeded limit of 200],
     'content-type': [TOO BIG formatValueCalls 205 exceeded limit of 200],
     date: [TOO BIG formatValueCalls 206 exceeded limit of 200],
     expires: [TOO BIG formatValueCalls 207 exceeded limit of 200],
     pragma: [TOO BIG formatValueCalls 208 exceeded limit of 200],
     priority: [TOO BIG formatValueCalls 209 exceeded limit of 200],
     'referrer-policy': [TOO BIG formatValueCalls 210 exceeded limit of 200],
     server: [TOO BIG formatValueCalls 211 exceeded limit of 200],
     'server-timing': [TOO BIG formatValueCalls 212 exceeded limit of 200],
     'set-cookie': [TOO BIG formatValueCalls 213 exceeded limit of 200],
     'strict-transport-security': [TOO BIG formatValueCalls 214 exceeded limit of 200],
     vary: [TOO BIG formatValueCalls 215 exceeded limit of 200],
     via: [TOO BIG formatValueCalls 216 exceeded limit of 200],
     'x-content-type-options': [TOO BIG formatValueCalls 217 exceeded limit of 200],
     'x-frame-options': [TOO BIG formatValueCalls 218 exceeded limit of 200],
     'x-xss-protection': [TOO BIG formatValueCalls 219 exceeded limit of 200] },
  config: [TOO BIG formatValueCalls 220 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 221 exceeded limit of 200] }
'fetchedConfig>>', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'existingConfig>>', null
~~~i m here 1
'~~~i m here 2', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'~~~i m here 3', 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED'
'configArray>>', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'configArray>>409', [ { key: 'SUCCESS',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment is done!',
    subtitle: 'We’re redirecting you to the next page...',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Successful.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'PENDING',
    viewType: 'PAYMENT_LOADER',
    title: 'We’re initiating your payment',
    subtitle: 'Please wait while we take you to the next page.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/In_Progress.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } } },
  { key: 'FAILED',
    viewType: 'PAYMENT_LOADER',
    title: 'Your payment failed!',
    subtitle: 'Please retry or use a different payment method. Any debited amount will be credited back to your source account within 7 days.',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Payment_Failed.json',
       meta: { duration: 2000, loop: false, height: 0.35, width: 0.35 } },
    action: { type: 'RETRY', title: 'Retry payment' } },
  { key: 'CONGRATS_HUB',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Test%20Drive.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Free%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_PAID_HOME_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    media: 
     { type: 'ANIMATION',
       url: 'https://fastly-production.24c.in/india/gs-bof/booking-initiation/Congrats%20-%20Home%20Test.json',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_VIDEO_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your video demo has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_FREE_HUB_DELIVERY',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully booked!',
    subtitle: 'Your showroom test drive has been booked successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Successfully completed!',
    subtitle: 'Your video demo has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } },
  { key: 'APP_DOWNLOAD_NUDGE',
    viewType: 'CONGRATS_LOADER',
    title: 'Glad you enjoyed the test drive!',
    titleColor: '#0f0f10',
    subtitleColor: '#717272',
    subtitle: 'Install our app to complete your token payment with ease and keep your car-buying journey on track.',
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/7f059898-20ba-4805-9726-26867acbfb83Success%20Check.json' },
    bottomMedia: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/0691d62d-d8e3-4f3c-b241-9e8596c3e0c7Frame%202147232581-min%20%281%29.png' },
    redirection: 
     { text: 'Download app',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { url: 'https://cars24.app.link/T1OOgRQyxIb' } },
    header: 
     { title: 'Test drive completed',
       leftIcon: 'arrow-left-outline',
       rightIcon: 'support-outline' } },
  { key: 'VIDEO_LINK_EXPIRED',
    viewType: 'CONGRATS_LOADER',
    title: 'Looks like you missed your slot!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: 
     { text: 'Reschedule',
       type: 'PRIMARY',
       action: 'DEEP_LINK',
       data: { appRedirection: 'cars24://slot-time-selection?appointmentId={appointmentId}&pageId=slots&isRescheduled=true&orderId={orderId}' } },
    description: 'No worries, you can pick a new time that suits you and continue your video call smoothly.' },
  { key: 'USER_AUTHENTICATION_FAILED',
    viewType: 'CONGRATS_LOADER',
    title: 'Call booked on another number!',
    media: 
     { type: 'IMAGE',
       url: 'https://static-cdn.cars24.com/prod/cms/2025/11/21/4bc8cea5-0f7b-44ca-8907-94efaf8c5352Frame%202147232603.png' },
    redirection: { text: 'Log In', type: 'PRIMARY', actionType: 'LOG_IN' },
    description: 'This video demo is for another number, please log in with a number you used to book it.' },
  { key: 'API_FAILURE_SCREEN',
    viewType: 'CONGRATS_LOADER',
    title: 'We missed that!',
    media: 
     { type: 'IMAGE',
       url: 'https://media.cars24.com/india/cms/prod/banners/root/2025/11/27/3523285a-0abe-4af4-9de0-684c352fb00c-frame-2147225342.png' },
    redirection: { text: 'Retry', type: 'PRIMARY', actionType: 'RETRY' },
    description: 'We couldn\'t process your request. Please try again in a moment.' },
  { key: 'PAYMENT_COMPLETED',
    viewType: 'CONGRATS_LOADER',
    title: 'Payment successful!',
    subtitle: 'Your token payment has been completed successfully!',
    bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
    bgGradient: [ '#016630', '#00A63E' ],
    media: 
     { type: 'ANIMATION',
       url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
       meta: { duration: 3000, loop: false } } } ]
'~~~videoTestDriveCompletedConfig', { key: 'CONGRATS_VIDEO_TEST_DRIVE_COMPLETED',
  viewType: 'CONGRATS_LOADER',
  title: 'Successfully completed!',
  subtitle: 'Your video demo has been completed successfully!',
  bgColor: 'linear-gradient(0deg,  #016630 -5.72%, #00A63E 64.52%)',
  bgGradient: [ '#016630', '#00A63E' ],
  media: 
   { type: 'ANIMATION',
     url: 'https://static-cdn.cars24.com/qa/cms/2025/11/17/9b4de459-b76a-4cb3-a12d-40c708a73192result_status_embed.riv',
     meta: { duration: 3000, loop: false } } }
'🎥 [Superapp] Call failed:', 'Call failed'
'on nav state change =====>', { stale: false,
  type: 'stack',
  key: 'stack-EpJW91hgPUjynlKhb-HKl',
  index: 2,
  routeNames: 
   [ 'Splash',
     'homeTab',
     'buyTab',
     'FASTAG_STACK',
     'Branches',
     'user_onboarding_screen_shown',
     'GetStartedScreen',
     'city_selector_screen_shown',
     'GroupedCities',
     'CallbackRequestScreen',
     'NeedHelpScreen',
     'InternetDisconnectedModal',
     'VideoCallLoaderScreen',
     'EasterEgg',
     'Web_view',
     'GenericWebViewModal',
     'AppBrowser',
     'SuperHome',
     'MyCarsBuy',
     'MyCars',
     'UserProfile',
     'BuyUsedCar',
     'GSandMarketPlaceWrapper',
     'NewCarDetail',
     'C2CSearchModal',
     'UnifiedSearchModal',
     'GalleryView',
     'LoginScreen',
     'WishlistComponent',
     'PersonalisedCarListComponent',
     'MyBookings',
     'UploadStatementPasswordScreen',
     'CarExchange',
     'GSCustomizeOffer',
     'GSConfirmBooking',
     'CheckoutFlowLoader',
     'GSKYCUpload',
     'ChatBotWebView_popup',
     'GSCancelBookingScreen',
     'CancelCancelledCar',
     'VariantShiftScreen',
     'AnalyticsLogger',
     'HelpHome',
     'AppPermissionScreen',
     'AppPermissionScreenModal',
     'TransactionHistoryScene',
     'TrackCarComponentScene',
     'CarFeatsAndSpecs',
     'ExchangeProgram',
     'CarCompare',
     'Help',
     'MultipleUsersScreen',
     'HubDirection',
     'GSCongratulationsV3',
     'PostCheckoutV1',
     'CarReturnComponentV1',
     'AllTicketsComponentV1',
     'RaiseZendeskTicketComponentV1',
     'UploadDocumentV1',
     'ZendeskTicketCommentsComponentV1',
     'ViewAllOffers',
     'PostCheckoutMyOrdersV1',
     'PostCheckoutWarrantyOrderDetail',
     'PostCheckoutWarrantyOrderRedirection',
     'RCTransferScene',
     'FaqContactUs',
     'FaqContactUsV2',
     'OrderSummaryV3',
     'ABVariantsInfo',

     'MrlWebview',
     'FullMapScreen',
     'DeliveryChecklist',
     'VisitRating',
     'DeliveryChecklistItems',
     'DeliveryRefundDetails',
     'DeliveryESign',
     'DeliveryOtpScreen',
     'ProfileMenu',
     'FilterScreen',
     'MarketPlaceFilterScreen',
     'ChargesBreakupScreen',
     'PaymentMethods',
     'NeftDetailsScreen',
     'AddMoreVisitCar',
     'CashPaymentDetailScreen',
     'InsuranceClaimProcess',
     'InsuranceNotCoveredItems',
     'InsurancePlanDetails',
     'TicketList',
     'TestDriveExperience',
     'OnBoardingUserDetail',
     'Cars24AddOns',
     'InsurancePlans',
     'NomineeDetails',
     'TcsDetails',
     'AddOnDetails',
     'BuyBackDetails',
     'BuyBackFairUsage',
     'AddOnWarranty',
     'AddOnVasProduct',
     'VasAccessoriesDetails',
     'ReturnInProgressDetails',
     'SingleImageViewer',
     'NewInspectionReport',
     'VerticalGallery',
     'NewWarrantyModal',
     'MultiCarCancelBooking',
     'PhysicalRcSteps',
     'DocumentsScreen',
     'AllTicketsScreen',
     'HelpDetail',
     'RCStages',
     'RCCompletedScreen',
     'RCEditAddress',
     'DetailedServiceHistory',
     'GSServiceHistoryOrderRedirection',
     'EsignStatusScreen',
     'Warranty',
     'WarrantyCoverage',
     'WarrantyCoverageSubPart',
     'RepairRequested',
     'WarrantyTicketDetails',
     'SpinTheWheel',
     'B2CVSummary',
     'FACEBOOK_LANDING',
     'WarrantyCategoriesSearch',
     'DigitalRC',
     'categoryPage',
     'NpsFeedbackScreen',
     'DevOptionsScreen',
     'RSA',
     'ServiceHistory',
     'RSAServiceDetail',
     'AMCBookingScreen',
     'BookAMCAppointment',
     'AmcFeedbackScreen',
     'AddNewAddress',
     'CsatFeedbackScreen',
     'LoanWithTokenStatus',
     'TokenBankingNudge',
     'TokenSuccessScreen',
     'PostVisitSummary',
     'RCDocumentUpload',
     'TokenCancellation',
     'TokenCancellationFeedback',
     'TokenBillDetailsScreen',
     'SwiperScreen',

     'FilePreview',
     'MultiFilesPreview',
     'Muhurat',
     'PostDeliveryBuyBack',
     'TestDriveFlowV3',
     'PostBookingSummaryV3',
     'TestDriveFlowV2',
     'AddressesManagement',
     'PostDeliveryLoan',
     'LoanPartners',
     'CancellationFeedBack',
     'ServiceHistoryOrderConfirmation',
     'GenericModal',
     'GenericOverlay',
     'DocumentScreen',
     'AppAssets',
     'ChangeBaseUrls',
     'NetworkLogger',
     'SimilarCarsPage',
     'CommunicationPreference',
     'ServiceTourFullScreenModel',
     'BillDetailsScreen',
     'PostDeliveryInsurance',
     'ViewAllUpdates',
     'WISHLIST_STANDALONE',
     'PreCheckoutToken',
     'PostCheckoutToken',
     'PVTTokenCancellation',
     'PayRemainingAmount',
     'PaymentJourney',
     'ProceedToPaymentSelection',
     'HubSlotBooking',
     'HubDetailsPage',
     'HubVisitDetails',
     'HelpMeChoose',
     'VerticalGalleryRevamped',
     'CarCategoryInfoScreen',
     'CarlessVerticalGallery',
     'SellerRedirectionScreen',
     'LocationTabs',
     'ListingPage',
     'home_screen_shown',
     'Car_Details_Modal_Screen',
     'book_appointment_screen_BI',
     'confirm_appointment',
     'web_quote_screen_shown',
     'OdometerScreen',
     [TOO BIG formatValueCalls 201 exceeded limit of 200],
     [TOO BIG formatValueCalls 202 exceeded limit of 200],
     [TOO BIG formatValueCalls 203 exceeded limit of 200],
     [TOO BIG formatValueCalls 204 exceeded limit of 200],
     [TOO BIG formatValueCalls 205 exceeded limit of 200],
     [TOO BIG formatValueCalls 206 exceeded limit of 200],
     [TOO BIG formatValueCalls 207 exceeded limit of 200],
     [TOO BIG formatValueCalls 208 exceeded limit of 200],
     [TOO BIG formatValueCalls 209 exceeded limit of 200],
     [TOO BIG formatValueCalls 210 exceeded limit of 200],
     [TOO BIG formatValueCalls 211 exceeded limit of 200],
     [TOO BIG formatValueCalls 212 exceeded limit of 200],
     [TOO BIG formatValueCalls 213 exceeded limit of 200],
     [TOO BIG formatValueCalls 214 exceeded limit of 200],
     [TOO BIG formatValueCalls 215 exceeded limit of 200],
     [TOO BIG formatValueCalls 216 exceeded limit of 200],
     [TOO BIG formatValueCalls 217 exceeded limit of 200],
     [TOO BIG formatValueCalls 218 exceeded limit of 200],
     [TOO BIG formatValueCalls 219 exceeded limit of 200],
     [TOO BIG formatValueCalls 220 exceeded limit of 200],
     [TOO BIG formatValueCalls 221 exceeded limit of 200],
     [TOO BIG formatValueCalls 222 exceeded limit of 200],
     [TOO BIG formatValueCalls 223 exceeded limit of 200],
     [TOO BIG formatValueCalls 224 exceeded limit of 200],
     [TOO BIG formatValueCalls 225 exceeded limit of 200],
     [TOO BIG formatValueCalls 226 exceeded limit of 200],
     [TOO BIG formatValueCalls 227 exceeded limit of 200],
     [TOO BIG formatValueCalls 228 exceeded limit of 200],
     [TOO BIG formatValueCalls 229 exceeded limit of 200],
     [TOO BIG formatValueCalls 230 exceeded limit of 200],
     [TOO BIG formatValueCalls 231 exceeded limit of 200],
     [TOO BIG formatValueCalls 232 exceeded limit of 200],
     [TOO BIG formatValueCalls 233 exceeded limit of 200],
     [TOO BIG formatValueCalls 234 exceeded limit of 200],
     [TOO BIG formatValueCalls 235 exceeded limit of 200],
     [TOO BIG formatValueCalls 236 exceeded limit of 200],
     [TOO BIG formatValueCalls 237 exceeded limit of 200],
     [TOO BIG formatValueCalls 238 exceeded limit of 200],
     [TOO BIG formatValueCalls 239 exceeded limit of 200],
     [TOO BIG formatValueCalls 240 exceeded limit of 200],
     [TOO BIG formatValueCalls 241 exceeded limit of 200],
     [TOO BIG formatValueCalls 242 exceeded limit of 200],
     [TOO BIG formatValueCalls 243 exceeded limit of 200],
     [TOO BIG formatValueCalls 244 exceeded limit of 200],
     [TOO BIG formatValueCalls 245 exceeded limit of 200],
     [TOO BIG formatValueCalls 246 exceeded limit of 200],
     [TOO BIG formatValueCalls 247 exceeded limit of 200],
     [TOO BIG formatValueCalls 248 exceeded limit of 200],
     [TOO BIG formatValueCalls 249 exceeded limit of 200],
     [TOO BIG formatValueCalls 250 exceeded limit of 200],
     [TOO BIG formatValueCalls 251 exceeded limit of 200],
     [TOO BIG formatValueCalls 252 exceeded limit of 200],
     [TOO BIG formatValueCalls 253 exceeded limit of 200],
     [TOO BIG formatValueCalls 254 exceeded limit of 200],
     [TOO BIG formatValueCalls 255 exceeded limit of 200],
     [TOO BIG formatValueCalls 256 exceeded limit of 200],
     [TOO BIG formatValueCalls 257 exceeded limit of 200],
     [TOO BIG formatValueCalls 258 exceeded limit of 200],
     [TOO BIG formatValueCalls 259 exceeded limit of 200],
     [TOO BIG formatValueCalls 260 exceeded limit of 200],
     [TOO BIG formatValueCalls 261 exceeded limit of 200],
     [TOO BIG formatValueCalls 262 exceeded limit of 200],
     [TOO BIG formatValueCalls 263 exceeded limit of 200],
     [TOO BIG formatValueCalls 264 exceeded limit of 200],
     [TOO BIG formatValueCalls 265 exceeded limit of 200],
     [TOO BIG formatValueCalls 266 exceeded limit of 200],
     [TOO BIG formatValueCalls 267 exceeded limit of 200],
     [TOO BIG formatValueCalls 268 exceeded limit of 200],
     [TOO BIG formatValueCalls 269 exceeded limit of 200],
     [TOO BIG formatValueCalls 270 exceeded limit of 200],
     [TOO BIG formatValueCalls 271 exceeded limit of 200],
     [TOO BIG formatValueCalls 272 exceeded limit of 200],
     [TOO BIG formatValueCalls 273 exceeded limit of 200],
     [TOO BIG formatValueCalls 274 exceeded limit of 200],
     [TOO BIG formatValueCalls 275 exceeded limit of 200],
     [TOO BIG formatValueCalls 276 exceeded limit of 200],
     [TOO BIG formatValueCalls 277 exceeded limit of 200],
     [TOO BIG formatValueCalls 278 exceeded limit of 200],
     [TOO BIG formatValueCalls 279 exceeded limit of 200],
     [TOO BIG formatValueCalls 280 exceeded limit of 200],
     [TOO BIG formatValueCalls 281 exceeded limit of 200],
     [TOO BIG formatValueCalls 282 exceeded limit of 200],
     [TOO BIG formatValueCalls 283 exceeded limit of 200],
     [TOO BIG formatValueCalls 284 exceeded limit of 200],
     [TOO BIG formatValueCalls 285 exceeded limit of 200],
     [TOO BIG formatValueCalls 286 exceeded limit of 200],
     [TOO BIG formatValueCalls 287 exceeded limit of 200],
     [TOO BIG formatValueCalls 288 exceeded limit of 200],
     [TOO BIG formatValueCalls 289 exceeded limit of 200],
     [TOO BIG formatValueCalls 290 exceeded limit of 200],
     [TOO BIG formatValueCalls 291 exceeded limit of 200],
     [TOO BIG formatValueCalls 292 exceeded limit of 200],
     [TOO BIG formatValueCalls 293 exceeded limit of 200],
     [TOO BIG formatValueCalls 294 exceeded limit of 200],
     [TOO BIG formatValueCalls 295 exceeded limit of 200],
     [TOO BIG formatValueCalls 296 exceeded limit of 200],
     [TOO BIG formatValueCalls 297 exceeded limit of 200],
     [TOO BIG formatValueCalls 298 exceeded limit of 200],
     [TOO BIG formatValueCalls 299 exceeded limit of 200],
     [TOO BIG formatValueCalls 300 exceeded limit of 200],
     [TOO BIG formatValueCalls 301 exceeded limit of 200],
     [TOO BIG formatValueCalls 302 exceeded limit of 200],
     [TOO BIG formatValueCalls 303 exceeded limit of 200],
     [TOO BIG formatValueCalls 304 exceeded limit of 200],
     [TOO BIG formatValueCalls 305 exceeded limit of 200],
     [TOO BIG formatValueCalls 306 exceeded limit of 200],
     [TOO BIG formatValueCalls 307 exceeded limit of 200],
     [TOO BIG formatValueCalls 308 exceeded limit of 200],
     [TOO BIG formatValueCalls 309 exceeded limit of 200],
     [TOO BIG formatValueCalls 310 exceeded limit of 200],
     [TOO BIG formatValueCalls 311 exceeded limit of 200],
     [TOO BIG formatValueCalls 312 exceeded limit of 200],
     [TOO BIG formatValueCalls 313 exceeded limit of 200],
     [TOO BIG formatValueCalls 314 exceeded limit of 200],
     [TOO BIG formatValueCalls 315 exceeded limit of 200],
     [TOO BIG formatValueCalls 316 exceeded limit of 200],
     [TOO BIG formatValueCalls 317 exceeded limit of 200],
     [TOO BIG formatValueCalls 318 exceeded limit of 200],
     [TOO BIG formatValueCalls 319 exceeded limit of 200],
     [TOO BIG formatValueCalls 320 exceeded limit of 200],
     [TOO BIG formatValueCalls 321 exceeded limit of 200],
     [TOO BIG formatValueCalls 322 exceeded limit of 200],
     [TOO BIG formatValueCalls 323 exceeded limit of 200],
     [TOO BIG formatValueCalls 324 exceeded limit of 200],
     [TOO BIG formatValueCalls 325 exceeded limit of 200],
     [TOO BIG formatValueCalls 326 exceeded limit of 200],
     [TOO BIG formatValueCalls 327 exceeded limit of 200],
     [TOO BIG formatValueCalls 328 exceeded limit of 200],
     [TOO BIG formatValueCalls 329 exceeded limit of 200],
     [TOO BIG formatValueCalls 330 exceeded limit of 200],
     [TOO BIG formatValueCalls 331 exceeded limit of 200],
     [TOO BIG formatValueCalls 332 exceeded limit of 200],
     [TOO BIG formatValueCalls 333 exceeded limit of 200],
     [TOO BIG formatValueCalls 334 exceeded limit of 200],
     [TOO BIG formatValueCalls 335 exceeded limit of 200],
     [TOO BIG formatValueCalls 336 exceeded limit of 200],
     [TOO BIG formatValueCalls 337 exceeded limit of 200],
     [TOO BIG formatValueCalls 338 exceeded limit of 200],
     [TOO BIG formatValueCalls 339 exceeded limit of 200],
     [TOO BIG formatValueCalls 340 exceeded limit of 200],
     [TOO BIG formatValueCalls 341 exceeded limit of 200],
     [TOO BIG formatValueCalls 342 exceeded limit of 200],
     [TOO BIG formatValueCalls 343 exceeded limit of 200],
     [TOO BIG formatValueCalls 344 exceeded limit of 200],
     [TOO BIG formatValueCalls 345 exceeded limit of 200],
     [TOO BIG formatValueCalls 346 exceeded limit of 200],
     [TOO BIG formatValueCalls 347 exceeded limit of 200],
     [TOO BIG formatValueCalls 348 exceeded limit of 200],
     [TOO BIG formatValueCalls 349 exceeded limit of 200],
     [TOO BIG formatValueCalls 350 exceeded limit of 200],
     [TOO BIG formatValueCalls 351 exceeded limit of 200],
     [TOO BIG formatValueCalls 352 exceeded limit of 200],
     [TOO BIG formatValueCalls 353 exceeded limit of 200],
     [TOO BIG formatValueCalls 354 exceeded limit of 200],
     [TOO BIG formatValueCalls 355 exceeded limit of 200],
     [TOO BIG formatValueCalls 356 exceeded limit of 200],
     [TOO BIG formatValueCalls 357 exceeded limit of 200],
     [TOO BIG formatValueCalls 358 exceeded limit of 200],
     [TOO BIG formatValueCalls 359 exceeded limit of 200],
     [TOO BIG formatValueCalls 360 exceeded limit of 200],
     [TOO BIG formatValueCalls 361 exceeded limit of 200],
     [TOO BIG formatValueCalls 362 exceeded limit of 200],
     [TOO BIG formatValueCalls 363 exceeded limit of 200],
     [TOO BIG formatValueCalls 364 exceeded limit of 200],
     [TOO BIG formatValueCalls 365 exceeded limit of 200],
     [TOO BIG formatValueCalls 366 exceeded limit of 200],
     [TOO BIG formatValueCalls 367 exceeded limit of 200],
     [TOO BIG formatValueCalls 368 exceeded limit of 200],
     [TOO BIG formatValueCalls 369 exceeded limit of 200],
     [TOO BIG formatValueCalls 370 exceeded limit of 200],
     [TOO BIG formatValueCalls 371 exceeded limit of 200],
     [TOO BIG formatValueCalls 372 exceeded limit of 200],
     [TOO BIG formatValueCalls 373 exceeded limit of 200],
     [TOO BIG formatValueCalls 374 exceeded limit of 200],
     [TOO BIG formatValueCalls 375 exceeded limit of 200],
     [TOO BIG formatValueCalls 376 exceeded limit of 200],
     [TOO BIG formatValueCalls 377 exceeded limit of 200],
     [TOO BIG formatValueCalls 378 exceeded limit of 200],
     [TOO BIG formatValueCalls 379 exceeded limit of 200],
     [TOO BIG formatValueCalls 380 exceeded limit of 200],
     [TOO BIG formatValueCalls 381 exceeded limit of 200],
     [TOO BIG formatValueCalls 382 exceeded limit of 200],
     [TOO BIG formatValueCalls 383 exceeded limit of 200],
     [TOO BIG formatValueCalls 384 exceeded limit of 200],
     [TOO BIG formatValueCalls 385 exceeded limit of 200],
     [TOO BIG formatValueCalls 386 exceeded limit of 200],
     [TOO BIG formatValueCalls 387 exceeded limit of 200],
     [TOO BIG formatValueCalls 388 exceeded limit of 200],
     [TOO BIG formatValueCalls 389 exceeded limit of 200],
     [TOO BIG formatValueCalls 390 exceeded limit of 200],
     [TOO BIG formatValueCalls 391 exceeded limit of 200],
     [TOO BIG formatValueCalls 392 exceeded limit of 200],
     [TOO BIG formatValueCalls 393 exceeded limit of 200],
     [TOO BIG formatValueCalls 394 exceeded limit of 200],
     [TOO BIG formatValueCalls 395 exceeded limit of 200],
     [TOO BIG formatValueCalls 396 exceeded limit of 200],
     [TOO BIG formatValueCalls 397 exceeded limit of 200],
     [TOO BIG formatValueCalls 398 exceeded limit of 200],
     [TOO BIG formatValueCalls 399 exceeded limit of 200],
     [TOO BIG formatValueCalls 400 exceeded limit of 200],
     [TOO BIG formatValueCalls 401 exceeded limit of 200],
     [TOO BIG formatValueCalls 402 exceeded limit of 200],
     [TOO BIG formatValueCalls 403 exceeded limit of 200],
     [TOO BIG formatValueCalls 404 exceeded limit of 200],
     [TOO BIG formatValueCalls 405 exceeded limit of 200],
     [TOO BIG formatValueCalls 406 exceeded limit of 200],
     [TOO BIG formatValueCalls 407 exceeded limit of 200],
     [TOO BIG formatValueCalls 408 exceeded limit of 200],
     [TOO BIG formatValueCalls 409 exceeded limit of 200],
     [TOO BIG formatValueCalls 410 exceeded limit of 200],
     [TOO BIG formatValueCalls 411 exceeded limit of 200],
     [TOO BIG formatValueCalls 412 exceeded limit of 200],
     [TOO BIG formatValueCalls 413 exceeded limit of 200],
     [TOO BIG formatValueCalls 414 exceeded limit of 200],
     [TOO BIG formatValueCalls 415 exceeded limit of 200],
     [TOO BIG formatValueCalls 416 exceeded limit of 200],
     [TOO BIG formatValueCalls 417 exceeded limit of 200],
     [TOO BIG formatValueCalls 418 exceeded limit of 200],
     [TOO BIG formatValueCalls 419 exceeded limit of 200],
     [TOO BIG formatValueCalls 420 exceeded limit of 200],
     [TOO BIG formatValueCalls 421 exceeded limit of 200],
     [TOO BIG formatValueCalls 422 exceeded limit of 200],
     [TOO BIG formatValueCalls 423 exceeded limit of 200],
     [TOO BIG formatValueCalls 424 exceeded limit of 200],
     [TOO BIG formatValueCalls 425 exceeded limit of 200],
     [TOO BIG formatValueCalls 426 exceeded limit of 200],
     [TOO BIG formatValueCalls 427 exceeded limit of 200],
     [TOO BIG formatValueCalls 428 exceeded limit of 200],
     [TOO BIG formatValueCalls 429 exceeded limit of 200],
     [TOO BIG formatValueCalls 430 exceeded limit of 200],
     [TOO BIG formatValueCalls 431 exceeded limit of 200],
     [TOO BIG formatValueCalls 432 exceeded limit of 200],
     [TOO BIG formatValueCalls 433 exceeded limit of 200],
     [TOO BIG formatValueCalls 434 exceeded limit of 200],
     [TOO BIG formatValueCalls 435 exceeded limit of 200],
     [TOO BIG formatValueCalls 436 exceeded limit of 200],
     [TOO BIG formatValueCalls 437 exceeded limit of 200],
     [TOO BIG formatValueCalls 438 exceeded limit of 200],
     [TOO BIG formatValueCalls 439 exceeded limit of 200],
     [TOO BIG formatValueCalls 440 exceeded limit of 200],
     [TOO BIG formatValueCalls 441 exceeded limit of 200],
     [TOO BIG formatValueCalls 442 exceeded limit of 200],
     [TOO BIG formatValueCalls 443 exceeded limit of 200],
     [TOO BIG formatValueCalls 444 exceeded limit of 200],
     [TOO BIG formatValueCalls 445 exceeded limit of 200],
     [TOO BIG formatValueCalls 446 exceeded limit of 200],
     [TOO BIG formatValueCalls 447 exceeded limit of 200],
     [TOO BIG formatValueCalls 448 exceeded limit of 200],
     [TOO BIG formatValueCalls 449 exceeded limit of 200],
     [TOO BIG formatValueCalls 450 exceeded limit of 200],
     [TOO BIG formatValueCalls 451 exceeded limit of 200],
     [TOO BIG formatValueCalls 452 exceeded limit of 200],
     [TOO BIG formatValueCalls 453 exceeded limit of 200],
     [TOO BIG formatValueCalls 454 exceeded limit of 200],
     [TOO BIG formatValueCalls 455 exceeded limit of 200],
     [TOO BIG formatValueCalls 456 exceeded limit of 200] ],
  routes: [TOO BIG formatValueCalls 457 exceeded limit of 200] }
'~~~variant', 'call-filled'
LOGIN SDK:: Starting token refresh
'LOGIN SDK:: %cinfo: Automatic token refresh initiated due to 401', 'color: blue', { url: 'https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details',
  method: 'get' }
'LOGIN SDK:: %cinfo: Attempting to refresh access token', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: request headers', { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
  method: 'post',
  data: 
   { grant_type: 'refresh_token',
     refresh_token: 'ory_rt_P7Fh5J3iVbF579D5qJVBU9ZFQBNQG39xAlFrESdSooo.UAxesOSh75ZC544enLJ_O1B9Epe83Kba6_ghIjCQeaU',
     client_id: 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
     redirect_uri: 'cars24://oauth' },
  headers: 
   { common: { Accept: 'application/json, text/plain, */*' },
     delete: {},
     get: {},
     head: {},
     post: { 'Content-Type': 'application/x-www-form-urlencoded' },
     put: { 'Content-Type': 'application/x-www-form-urlencoded' },
     patch: { 'Content-Type': 'application/x-www-form-urlencoded' },
     osName: 'ios',
     mediaSource: 'HELLO_AR',
     source: 'mobile',
     SOURCE: 'MobileApp',
     'Content-Type': 'application/json',
     'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
     'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99' },
  transformRequest: [ [Function: transformRequest] ],
  transformResponse: [ [Function: transformResponse] ],
  timeout: 0,
  withCredentials: true,
  adapter: [Function: xhrAdapter],
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-XSRF-TOKEN',
  maxContentLength: -1,
  maxBodyLength: -1,
  validateStatus: [Function: validateStatus],
  transitional: 
   { silentJSONParsing: true,
     forcedJSONParsing: true,
     clarifyTimeoutError: false } }
'LOGIN SDK:: RESPONSE', { data: 
   { success: true,
     message: 'Token data',
     data: 
      { access_token: 'eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNiwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNSwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjNmZGM0NjY3LTM5ZGQtNGZhNC04Y2VjLTkzODcxNjc2OGIyNiIsIm5iZiI6MTc3MzEzMTYyNSwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.hM7kK7EzZRP9aRgbIXjaGvf9Um3gDmi_Ui5fbB8LhjnUpUi24IuGTP9WrZN85alKG7JmBoebT-zuUUhOosxHig',
        session_id: '3be89bab-2338-4f7b-986d-a3a04cf90f2a',
        token_type: 'bearer',

        expires_in: 900,
        refresh_token: 'ory_rt_NaW2hVFXR6KuYX-9_QzO2-Q0AYko7TTphdqBA3QoA-g._B7LtbZbKzEUjYAtrSoW7m381U9pWogqgHxdCkUz84U',
        refresh_token_expiry_in: 86400 } },
  status: 200,
  statusText: undefined,
  headers: 
   { 'alt-svc': 'h3=":443"; ma=86400',
     'cf-cache-status': 'DYNAMIC',
     'cf-ray': '9da0f9f57def9cd7-DEL',
     'content-encoding': 'br',
     'content-type': 'application/json; charset=utf-8',
     date: 'Tue, 10 Mar 2026 08:33:45 GMT',
     priority: 'u=3,i',
     server: 'cloudflare',
     'server-timing': 'cfExtPri',
     'set-cookie': [ '__cf_bm=Ie4ZIw9rJ3R_plPU3gLFXTopT_gyU9nE6YHyedLtgoI-1773131625-1.0.1.1-ZrGyndcqyTC.4XnXG.qkIkT56Ak1PkFf_Fyf6mW7swOa2qvtNTsUSXczqNMHzd5qBECOCNv5bEwbjscRvLBu5wpgLq3ZSEw5L7_o7N.jljk; path=/; expires=Tue, 10-Mar-26 09:03:45 GMT; domain=.qac24svc.dev; HttpOnly; Secure; SameSite=None' ] },
  config: 
   { url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     method: 'post',
     data: '{"grant_type":"refresh_token","refresh_token":"ory_rt_P7Fh5J3iVbF579D5qJVBU9ZFQBNQG39xAlFrESdSooo.UAxesOSh75ZC544enLJ_O1B9Epe83Kba6_ghIjCQeaU","client_id":"client_3L2Q2B-DFrgi2JiZYJAhRw","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","redirect_uri":"cars24://oauth"}',
     headers: 
      { Accept: 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        osName: 'ios',
        mediaSource: 'HELLO_AR',
        source: 'mobile',
        SOURCE: 'MobileApp',
        'x-client-id': 'client_3L2Q2B-DFrgi2JiZYJAhRw',
        'x-device-id': '70f9965d-0ebf-443a-a85a-da4e61bb4e99',
        appVersion: '566',
        userAgent: 'cars24CustomerApp/566',
        x_experiment_id: '664f4f0a-bcef-4191-a756-8de0a5385529',
        X_APP_INSTANCE_ID: 'D8E5F60D27104A749B497420F1263BC3' },
     transformRequest: [ [Function: transformRequest] ],
     transformResponse: [ [Function: transformResponse] ],
     timeout: 0,
     withCredentials: true,
     adapter: [Function: xhrAdapter],
     xsrfCookieName: 'XSRF-TOKEN',
     xsrfHeaderName: 'X-XSRF-TOKEN',
     maxContentLength: -1,
     maxBodyLength: -1,
     validateStatus: [Function: validateStatus],
     transitional: 
      { silentJSONParsing: true,
        forcedJSONParsing: true,
        clarifyTimeoutError: false } },
  request: 
   { UNSENT: 0,
     OPENED: 1,
     HEADERS_RECEIVED: 2,
     LOADING: 3,
     DONE: 4,
     readyState: 4,
     status: 200,
     timeout: 0,
     withCredentials: true,
     upload: {},
     _aborted: false,
     _hasError: false,
     _method: 'POST',
     _perfKey: 'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token',
     _response: '{"success":true,"message":"Token data","data":{"access_token":"eyJhbGciOiJFUzI1NiIsImtpZCI6ImVhNmM1MTM1LTJjYWEtNDYxZC04NTUxLTliNzU3OWIzNmU1NyIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJjbGllbnRfaWQiOiJjbGllbnRfM0wyUTJCLURGcmdpMkppWllKQWhSdyIsImV4cCI6MTc3MzEzMjUyNiwiZXh0Ijp7Imdyb3VwX2lkIjoiY2M3MTJhMjEtNTM1NC00NWQzLWIwNDctMzE4MmRjNzMzYTc2Iiwic2Vzc2lvbl9pZCI6IjNiZTg5YmFiLTIzMzgtNGY3Yi05ODZkLWEzYTA0Y2Y5MGYyYSIsInVzZXJfdHlwZSI6IkVYVEVSTkFMIn0sImlhdCI6MTc3MzEzMTYyNSwiaXNzIjoiaHR0cHM6Ly9hdXRoLXNlcnZpY2Utc3RhZ2UucWFjMjRzdmMuZGV2LyIsImp0aSI6IjNmZGM0NjY3LTM5ZGQtNGZhNC04Y2VjLTkzODcxNjc2OGIyNiIsIm5iZiI6MTc3MzEzMTYyNSwic2NwIjpbIm9mZmxpbmVfYWNjZXNzIl0sInN1YiI6IjU1ZTJjMzE4LWUyNDItNDVkMy1hZWFkLTMwZGNlMzdlM2ZkNSJ9.hM7kK7EzZRP9aRgbIXjaGvf9Um3gDmi_Ui5fbB8LhjnUpUi24IuGTP9WrZN85alKG7JmBoebT-zuUUhOosxHig","session_id":"3be89bab-2338-4f7b-986d-a3a04cf90f2a","token_type":"bearer","expires_in":900,"refresh_token":"ory_rt_NaW2hVFXR6KuYX-9_QzO2-Q0AYko7TTphdqBA3QoA-g._B7LtbZbKzEUjYAtrSoW7m381U9pWogqgHxdCkUz84U","refresh_token_expiry_in":86400}}',
     _url: 'https://auth-service-stage.qac24svc.dev/oauth2/token',
     _timedOut: false,
     _trackingName: 'unknown',
     _incrementalEvents: true,
     _startTime: 185372085.0085,
     _performanceLogger: 
      { _timespans: 
         { 'network_XMLHttpRequest_http://127.0.0.1:7242/ingest/42ceee0a-d8e1-4bec-b72e-02ff0666fae4': { startTime: 183722926.521166, startExtras: undefined },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/config-api/get-data': 
            { startTime: 183722934.035416,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.198541,
              totalTime: 431.1631249785423 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/feature-config/road-safety': 
            { startTime: 183722935.00975,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723365.768541,
              totalTime: 430.75879099965096 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v4/cars/all': 
            { startTime: 183723779.319166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183723851.971,
              totalTime: 72.65183398127556 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/ums/users': 
            { startTime: 183723802.736125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725154.111875,
              totalTime: 1351.3757500052452 },
           'network_XMLHttpRequest_https://featuregates.org/v1/initialize': 
            { startTime: 183725130.734625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725866.961958,
              totalTime: 736.2273329794407 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v3/cars/all': 
            { startTime: 183725175.758375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183725717.893708,
              totalTime: 542.1353330016136 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/user-login/screen-config': 
            { startTime: 183725901.489916,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726024.049083,
              totalTime: 122.55916699767113 },
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/introspect': 
            { startTime: 183725903.702166,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183726030.1225,
              totalTime: 126.4203340113163 },
           'network_XMLHttpRequest_https://events.statsigapi.net/v1/rgstr': 
            { startTime: 183726479.479875,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728505.264625,
              totalTime: 2025.7847500145435 },
           'network_XMLHttpRequest_https://stage-pvt-product.qac24svc.dev/pp/user/kyc': 
            { startTime: 183726526.79275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728476.387541,
              totalTime: 1949.594790995121 },
           'network_XMLHttpRequest_https://api.stalliontech.io/api/v1/analytics/log-bulk-events': 
            { startTime: 183726527.518375,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728506.516833,
              totalTime: 1978.9984579980373 },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/api/v1/city': 
            { startTime: 183726566.129625,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.454125,
              totalTime: 1957.3244999945164 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/get-config': 
            { startTime: 183726566.375125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728508.781625,
              totalTime: 1942.4065000116825 },
           'network_XMLHttpRequest_https://vehicle-service-stage.qac24svc.dev/faq-search?version=2': 
            { startTime: 183726566.57525,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728523.06475,
              totalTime: 1956.4894999861717 },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980329': { startTime: 183726569.826833, startExtras: undefined },
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773129980330': 
            { startTime: 183726570.926458,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728507.258666,
              totalTime: 1936.332208007574 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v7/bff-schema/super-app-pages/home?cityId=5&pageId=home&platform=APP&useNewContextualService=true&contextualCardBuName=&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183727596.36275,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728556.613333,
              totalTime: 960.2505829930305 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/bff-schema/snackbar?cityId=5&platform=APP&latitude=28.441361239836574&longitude=77.03990984771761': 
            { startTime: 183728313.313083,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728822.613666,
              totalTime: 509.3005830049515 },
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/initialize?cityId=5&clientId=d54b89ad-bbb5-44e9-9f78-4536d279c533&new_home_page_transformation=1': 
            { startTime: 183728473.771125,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728913.473083,
              totalTime: 439.70195800065994 },
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/coupon/opt-in?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': 
            { startTime: 183728474.696791,
              startExtras: undefined,
              endExtras: undefined,
              endTime: 183728834.236166,
              totalTime: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v4/facets': [TOO BIG formatValueCalls 202 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-rewards/d54b89ad-bbb5-44e9-9f78-4536d279c533?type=OFFER': [TOO BIG formatValueCalls 203 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-addon-service-in.qac24svc.dev/user-data/device': [TOO BIG formatValueCalls 204 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/wishlist/v1': [TOO BIG formatValueCalls 205 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/user-rewards?user-id=55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 206 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-api.theloan24.in/app/user/55e2c318-e242-45d3-aead-30dce37e3fd5/variants': [TOO BIG formatValueCalls 207 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/cf/user-check/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 208 exceeded limit of 200],
           'network_XMLHttpRequest_https://lead-service-java-stage.qac24svc.dev/v5/appointment-widget': [TOO BIG formatValueCalls 209 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/user-details/variant': [TOO BIG formatValueCalls 210 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-coupon-service.qac24svc.dev/v1/client-mapping': [TOO BIG formatValueCalls 211 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v1/user/my-rm': [TOO BIG formatValueCalls 212 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/order/juspay/sdk-init': [TOO BIG formatValueCalls 213 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-customer-profile-service.qac24svc.dev/v1/customer/profile/55e2c318-e242-45d3-aead-30dce37e3fd5': [TOO BIG formatValueCalls 214 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/home-page-rules/mark-seen/CONTACTS': [TOO BIG formatValueCalls 215 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130042530': [TOO BIG formatValueCalls 216 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130102592': [TOO BIG formatValueCalls 217 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130162641': [TOO BIG formatValueCalls 218 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130222691': [TOO BIG formatValueCalls 219 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130282737': [TOO BIG formatValueCalls 220 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130342822': [TOO BIG formatValueCalls 221 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130402985': [TOO BIG formatValueCalls 222 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130463024': [TOO BIG formatValueCalls 223 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130523057': [TOO BIG formatValueCalls 224 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130583100': [TOO BIG formatValueCalls 225 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130643140': [TOO BIG formatValueCalls 226 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130703177': [TOO BIG formatValueCalls 227 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130763223': [TOO BIG formatValueCalls 228 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130823278': [TOO BIG formatValueCalls 229 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130883317': [TOO BIG formatValueCalls 230 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773130943372': [TOO BIG formatValueCalls 231 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131003421': [TOO BIG formatValueCalls 232 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131063468': [TOO BIG formatValueCalls 233 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131123557': [TOO BIG formatValueCalls 234 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131183597': [TOO BIG formatValueCalls 235 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131243648': [TOO BIG formatValueCalls 236 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131303686': [TOO BIG formatValueCalls 237 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131363722': [TOO BIG formatValueCalls 238 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131423763': [TOO BIG formatValueCalls 239 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131483805': [TOO BIG formatValueCalls 240 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131543858': [TOO BIG formatValueCalls 241 exceeded limit of 200],
           'network_XMLHttpRequest_https://auth-service-stage.qac24svc.dev/oauth2/token': [TOO BIG formatValueCalls 242 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/listing/v2/buy-used-car': [TOO BIG formatValueCalls 243 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/homepage/v3/personalised': [TOO BIG formatValueCalls 244 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/filter/v1/meta': [TOO BIG formatValueCalls 245 exceeded limit of 200],
           'network_XMLHttpRequest_https://clients3.google.com/generate_204?_=1773131603901': [TOO BIG formatValueCalls 246 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-car-catalog-gateway-in.qac24svc.dev/detail/v1/': [TOO BIG formatValueCalls 247 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v3/order/checkout-flow/4450501923?vehiclePrice=320000': [TOO BIG formatValueCalls 248 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details': [TOO BIG formatValueCalls 249 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-super-app-backend.qac24svc.dev/api/v1/location/confirm-booking': [TOO BIG formatValueCalls 250 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-b2c-oms.qac24svc.dev/api/v1/video-call/meta?orderId=AP9B7J&appointmentId=4450501923': [TOO BIG formatValueCalls 251 exceeded limit of 200],
           'network_XMLHttpRequest_https://stage-oms-aggregator-service.qac24svc.dev/api/v2/order/pre-checkout/config/CONFIRM_BOOKING_LOADERS': [TOO BIG formatValueCalls 252 exceeded limit of 200] },
        _extras: [TOO BIG formatValueCalls 253 exceeded limit of 200],
        _points: [TOO BIG formatValueCalls 254 exceeded limit of 200],
        _pointExtras: [TOO BIG formatValueCalls 255 exceeded limit of 200],
        _closed: [TOO BIG formatValueCalls 256 exceeded limit of 200] },
     responseHeaders: [TOO BIG formatValueCalls 257 exceeded limit of 200],
     _requestId: [TOO BIG formatValueCalls 258 exceeded limit of 200],
     _cachedResponse: [TOO BIG formatValueCalls 259 exceeded limit of 200],
     _headers: [TOO BIG formatValueCalls 260 exceeded limit of 200],
     _responseType: [TOO BIG formatValueCalls 261 exceeded limit of 200],
     _sent: [TOO BIG formatValueCalls 262 exceeded limit of 200],
     _lowerCaseResponseHeaders: [TOO BIG formatValueCalls 263 exceeded limit of 200],
     _subscriptions: [TOO BIG formatValueCalls 264 exceeded limit of 200],
     _index: [TOO BIG formatValueCalls 265 exceeded limit of 200],
     responseURL: [TOO BIG formatValueCalls 266 exceeded limit of 200] } }
'LOGIN SDK:: %cbreadcrumb: Storing authentication tokens', 'color: black', { hasPhoneNumber: false,
  sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
✅ Provider app saving tokens with ownership metadata: unknown
✅ Tokens synced to cross-app storage
'LOGIN SDK:: %cinfo: Tokens stored successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
'LOGIN SDK:: %cinfo: Access token refreshed successfully', 'color: blue', { sessionId: '3be89bab-2338-4f7b-986d-a3a04cf90f2a' }
LOGIN SDK:: Token refresh successful
'LOGIN SDK:: %cinfo: Automatic token refresh successful', 'color: blue', undefined
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
nw_socket_handle_socket_event [C944.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C944.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C944.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C944.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C944.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C944] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300721540 Failed : error 0:61 [61]
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
'LOGIN SDK:: RESPONSE', { data: 
   { order: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        totalAmount: 320000,
        vehiclePrice: 320000,
        originalPrice: 320000,
        bookingAmount: 0,

        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           pincode: '122011',
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA' },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.16Z',
        userDetailsSubmitted: false,
        userVariant: 'B',
        pincodeServiceable: true,
        deliveryTime: 
         { date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500',
                empty: false } ],
           empty: false },
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        hubCode: 'LC_19',
        carCityId: 5,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        reservationDetail: 
         { reservationCityMode: 'NO_RESERVE',
           reservationChargesCategory: 'FREE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        listingDiscountCoupons: [],
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        nonReserveTokenDone: false,
        isReschedule: false,
        pvtTokenAmount: 0,
        orderVisited: false },
     extraInfo: { appLink: 'https://cars24.app.link/T1OOgRQyxIb' },
     serviceRequest: 
      { id: '69afcfe6d0949a3eb7d720b5',
        orderId: 'AP9B7J',
        serviceRequestId: 'AP9B7J-SR-1',
        deliveryMode: 'VIDEO',
        slotStartTime: 1773133200000,
        slotEndTime: 1773135000000,
        status: 'CREATED',
        offeringConfig: 
         { offeringId: 'VIDEO_CALL_LIVE_FREE',
           type: 'VIDEO',
           title: 'Live video car demo',
           amount: 99,
           finalAmount: 0,
           refundable: true,
           enabled: true,
           limitPerMonth: 4,
           sortingOrder: 3 },
        isReschedule: true,
        createdAt: '2026-03-10T08:01:42.069',
        updatedAt: '2026-03-10T08:33:43.073' },
     data: 
      [ { key: 'TEST_DRIVE_HEADER',
          viewType: 'TEST_DRIVE_HEADER_VIEWTYPE',
          data: 
           { background: 'linear-gradient(0deg,  #016630 -5.72%,  #00A63E 64.52%)',
             darkBgHeader: true,
             backgroundGradient: [ '#016630', '#00A63E' ],
             stickyHeaderBackground: '#00A63E',
             title: 'Video demo booked',
             leftIcon: { icon: 'arrow-left-outline', theme: 'dark' },
             rightIcon: 
              { icon: 'share-1',
                theme: 'dark',
                redirection: 
                 { action: 'SHARE',
                   data: { template: 'I’ve scheduled a *Video Call Test Drive* for this car and wanted to share the details 👇\n🚗 Car: *2014 Toyota Innova*\n⭐ Priced at: 3.20 lakh\n📅 Test drive details: 10 Mar at 2:30 PM - 3:00 PM\n\nCheck out this car!\nhttps://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923' } } },
             carStateCard: 
              { primaryTitle: { text: 'Your video demo will', color: '#0F172B' },
                secondaryTitle: { text: 'start at 2:30 PM today', color: '#368C61' },
                subTitle: { text: 'We will assign you an expert soon', color: '#62748E' },
                borderColor: '#C4D6E5',
                media: 
                 { url: 'https://media.cars24.com/india/buy/bof/video-call/Calendar.png',
                   alt: 'car-image',
                   type: 'image' },
                cornerBadge: { url: 'https://media.cars24.com/india/buy/bof/video-call/ConfirmedBagde.png' },
                footer: 
                 { ctas: 
                    [ { text: 'Join video call',
                        type: 'PRIMARY',
                        disable: true,
                        redirection: 
                         { action: 'WEB_VIEW',
                           data: 
                            { appRedirection: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}',
                              url: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}' } },
                        fixedCta: false } ] } },
             carDetailCard: 
              { title: { text: '2014 Toyota Innova', color: '#FFFFFF' },
                subTitle: 
                 { text: '2.5 VX 8 STR BS IV • 3.20 lakh',
                   color: 'rgba(255, 255, 255, 0.80)' },
                media: 
                 { alt: 'car-image',
                   type: 'image',
                   overlayImage: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format' },
                background: 'rgba(0, 0, 0, 0.10)',
                borderColor: 'rgba(255, 255, 255, 0.40)',
                cta: 
                 { text: 'View this car',
                   type: 'WHITE',
                   underLine: false,
                   rightIcon: { icon: 'arrow-right-outline', color: '#FFFFFF' },
                   redirection: 
                    { action: 'DEEP_LINK',
                      data: 
                       { appRedirection: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true&source=video-thankyou',
                         url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true' } },
                   fixedCta: false } } } },
        { key: 'OTHER_OFFERINGS_CARD',
          viewType: 'OTHER_OFFERINGS_CARD_VIEWTYPE',
          widgetHeader: 
           { title: 'More test drive options for you',
             description: 'Experience this car in person before buying' },
          data: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
        [TOO BIG formatValueCalls 202 exceeded limit of 200],
        [TOO BIG formatValueCalls 203 exceeded limit of 200],
        [TOO BIG formatValueCalls 204 exceeded limit of 200] ] },
  status: [TOO BIG formatValueCalls 205 exceeded limit of 200],
  statusText: [TOO BIG formatValueCalls 206 exceeded limit of 200],
  headers: [TOO BIG formatValueCalls 207 exceeded limit of 200],
  config: [TOO BIG formatValueCalls 208 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 209 exceeded limit of 200] }
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details: 200', { data: 
   { order: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        totalAmount: 320000,
        vehiclePrice: 320000,
        originalPrice: 320000,
        bookingAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           pincode: '122011',
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA' },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.16Z',
        userDetailsSubmitted: false,
        userVariant: 'B',
        pincodeServiceable: true,
        deliveryTime: 
         { date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500',
                empty: false } ],
           empty: false },
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        hubCode: 'LC_19',
        carCityId: 5,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        reservationDetail: 
         { reservationCityMode: 'NO_RESERVE',
           reservationChargesCategory: 'FREE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        listingDiscountCoupons: [],
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        nonReserveTokenDone: false,
        isReschedule: false,
        pvtTokenAmount: 0,
        orderVisited: false },
     extraInfo: { appLink: 'https://cars24.app.link/T1OOgRQyxIb' },
     serviceRequest: 
      { id: '69afcfe6d0949a3eb7d720b5',
        orderId: 'AP9B7J',
        serviceRequestId: 'AP9B7J-SR-1',
        deliveryMode: 'VIDEO',
        slotStartTime: 1773133200000,
        slotEndTime: 1773135000000,
        status: 'CREATED',
        offeringConfig: 
         { offeringId: 'VIDEO_CALL_LIVE_FREE',
           type: 'VIDEO',
           title: 'Live video car demo',
           amount: 99,
           finalAmount: 0,
           refundable: true,
           enabled: true,
           limitPerMonth: 4,
           sortingOrder: 3 },
        isReschedule: true,
        createdAt: '2026-03-10T08:01:42.069',
        updatedAt: '2026-03-10T08:33:43.073' },
     data: 
      [ { key: 'TEST_DRIVE_HEADER',
          viewType: 'TEST_DRIVE_HEADER_VIEWTYPE',
          data: 
           { background: 'linear-gradient(0deg,  #016630 -5.72%,  #00A63E 64.52%)',
             darkBgHeader: true,
             backgroundGradient: [ '#016630', '#00A63E' ],
             stickyHeaderBackground: '#00A63E',
             title: 'Video demo booked',
             leftIcon: { icon: 'arrow-left-outline', theme: 'dark' },
             rightIcon: 
              { icon: 'share-1',
                theme: 'dark',
                redirection: 
                 { action: 'SHARE',
                   data: { template: 'I’ve scheduled a *Video Call Test Drive* for this car and wanted to share the details 👇\n🚗 Car: *2014 Toyota Innova*\n⭐ Priced at: 3.20 lakh\n📅 Test drive details: 10 Mar at 2:30 PM - 3:00 PM\n\nCheck out this car!\nhttps://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923' } } },
             carStateCard: 
              { primaryTitle: { text: 'Your video demo will', color: '#0F172B' },
                secondaryTitle: { text: 'start at 2:30 PM today', color: '#368C61' },
                subTitle: { text: 'We will assign you an expert soon', color: '#62748E' },
                borderColor: '#C4D6E5',
                media: 
                 { url: 'https://media.cars24.com/india/buy/bof/video-call/Calendar.png',
                   alt: 'car-image',
                   type: 'image' },
                cornerBadge: { url: 'https://media.cars24.com/india/buy/bof/video-call/ConfirmedBagde.png' },
                footer: 
                 { ctas: 
                    [ { text: 'Join video call',
                        type: 'PRIMARY',
                        disable: true,
                        redirection: 
                         { action: 'WEB_VIEW',
                           data: 
                            { appRedirection: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}',
                              url: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}' } },
                        fixedCta: false } ] } },
             carDetailCard: 
              { title: { text: '2014 Toyota Innova', color: '#FFFFFF' },
                subTitle: 
                 { text: '2.5 VX 8 STR BS IV • 3.20 lakh',
                   color: 'rgba(255, 255, 255, 0.80)' },
                media: 
                 { alt: 'car-image',
                   type: 'image',
                   overlayImage: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format' },
                background: 'rgba(0, 0, 0, 0.10)',
                borderColor: 'rgba(255, 255, 255, 0.40)',
                cta: 
                 { text: 'View this car',
                   type: 'WHITE',
                   underLine: false,
                   rightIcon: { icon: 'arrow-right-outline', color: '#FFFFFF' },
                   redirection: 
                    { action: 'DEEP_LINK',
                      data: 
                       { appRedirection: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true&source=video-thankyou',
                         url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true' } },
                   fixedCta: false } } } },
        { key: 'OTHER_OFFERINGS_CARD',
          viewType: 'OTHER_OFFERINGS_CARD_VIEWTYPE',
          widgetHeader: 
           { title: 'More test drive options for you',
             description: 'Experience this car in person before buying' },
          data: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
        [TOO BIG formatValueCalls 202 exceeded limit of 200],
        [TOO BIG formatValueCalls 203 exceeded limit of 200],
        [TOO BIG formatValueCalls 204 exceeded limit of 200] ] },
  status: [TOO BIG formatValueCalls 205 exceeded limit of 200],
  statusText: [TOO BIG formatValueCalls 206 exceeded limit of 200],
  headers: [TOO BIG formatValueCalls 207 exceeded limit of 200],
  config: [TOO BIG formatValueCalls 208 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 209 exceeded limit of 200] }
'API Response https://stage-oms-aggregator-service.qac24svc.dev/api/v5/order/AP9B7J/post-checkout-details: 200', { data: 
   { order: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        totalAmount: 320000,
        vehiclePrice: 320000,
        originalPrice: 320000,
        bookingAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           pincode: '122011',
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA' },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.16Z',
        userDetailsSubmitted: false,
        userVariant: 'B',
        pincodeServiceable: true,
        deliveryTime: 
         { date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500',
                empty: false } ],
           empty: false },
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        hubCode: 'LC_19',
        carCityId: 5,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        reservationDetail: 
         { reservationCityMode: 'NO_RESERVE',
           reservationChargesCategory: 'FREE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        listingDiscountCoupons: [],
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        nonReserveTokenDone: false,
        isReschedule: false,
        pvtTokenAmount: 0,
        orderVisited: false },
     extraInfo: { appLink: 'https://cars24.app.link/T1OOgRQyxIb' },
     serviceRequest: 
      { id: '69afcfe6d0949a3eb7d720b5',
        orderId: 'AP9B7J',
        serviceRequestId: 'AP9B7J-SR-1',
        deliveryMode: 'VIDEO',
        slotStartTime: 1773133200000,
        slotEndTime: 1773135000000,
        status: 'CREATED',
        offeringConfig: 
         { offeringId: 'VIDEO_CALL_LIVE_FREE',
           type: 'VIDEO',
           title: 'Live video car demo',
           amount: 99,
           finalAmount: 0,
           refundable: true,
           enabled: true,
           limitPerMonth: 4,
           sortingOrder: 3 },
        isReschedule: true,
        createdAt: '2026-03-10T08:01:42.069',
        updatedAt: '2026-03-10T08:33:43.073' },
     data: 
      [ { key: 'TEST_DRIVE_HEADER',
          viewType: 'TEST_DRIVE_HEADER_VIEWTYPE',
          data: 
           { background: 'linear-gradient(0deg,  #016630 -5.72%,  #00A63E 64.52%)',
             darkBgHeader: true,
             backgroundGradient: [ '#016630', '#00A63E' ],
             stickyHeaderBackground: '#00A63E',
             title: 'Video demo booked',
             leftIcon: { icon: 'arrow-left-outline', theme: 'dark' },
             rightIcon: 
              { icon: 'share-1',
                theme: 'dark',
                redirection: 
                 { action: 'SHARE',
                   data: { template: 'I’ve scheduled a *Video Call Test Drive* for this car and wanted to share the details 👇\n🚗 Car: *2014 Toyota Innova*\n⭐ Priced at: 3.20 lakh\n📅 Test drive details: 10 Mar at 2:30 PM - 3:00 PM\n\nCheck out this car!\nhttps://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923' } } },
             carStateCard: 
              { primaryTitle: { text: 'Your video demo will', color: '#0F172B' },
                secondaryTitle: { text: 'start at 2:30 PM today', color: '#368C61' },
                subTitle: { text: 'We will assign you an expert soon', color: '#62748E' },
                borderColor: '#C4D6E5',
                media: 
                 { url: 'https://media.cars24.com/india/buy/bof/video-call/Calendar.png',
                   alt: 'car-image',
                   type: 'image' },
                cornerBadge: { url: 'https://media.cars24.com/india/buy/bof/video-call/ConfirmedBagde.png' },
                footer: 
                 { ctas: 
                    [ { text: 'Join video call',
                        type: 'PRIMARY',
                        disable: true,
                        redirection: 
                         { action: 'WEB_VIEW',
                           data: 
                            { appRedirection: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}',
                              url: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}' } },
                        fixedCta: false } ] } },
             carDetailCard: 
              { title: { text: '2014 Toyota Innova', color: '#FFFFFF' },
                subTitle: 
                 { text: '2.5 VX 8 STR BS IV • 3.20 lakh',
                   color: 'rgba(255, 255, 255, 0.80)' },
                media: 
                 { alt: 'car-image',
                   type: 'image',
                   overlayImage: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format' },
                background: 'rgba(0, 0, 0, 0.10)',
                borderColor: 'rgba(255, 255, 255, 0.40)',
                cta: 
                 { text: 'View this car',
                   type: 'WHITE',
                   underLine: false,
                   rightIcon: { icon: 'arrow-right-outline', color: '#FFFFFF' },
                   redirection: 
                    { action: 'DEEP_LINK',
                      data: 
                       { appRedirection: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true&source=video-thankyou',
                         url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true' } },
                   fixedCta: false } } } },
        { key: 'OTHER_OFFERINGS_CARD',
          viewType: 'OTHER_OFFERINGS_CARD_VIEWTYPE',
          widgetHeader: 
           { title: 'More test drive options for you',
             description: 'Experience this car in person before buying' },
          data: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
        [TOO BIG formatValueCalls 202 exceeded limit of 200],
        [TOO BIG formatValueCalls 203 exceeded limit of 200],
        [TOO BIG formatValueCalls 204 exceeded limit of 200] ] },
  status: [TOO BIG formatValueCalls 205 exceeded limit of 200],
  statusText: [TOO BIG formatValueCalls 206 exceeded limit of 200],
  headers: [TOO BIG formatValueCalls 207 exceeded limit of 200],
  config: [TOO BIG formatValueCalls 208 exceeded limit of 200],
  request: [TOO BIG formatValueCalls 209 exceeded limit of 200] }
'fetchedPostCheckoutData', { data: 
   { order: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        totalAmount: 320000,
        vehiclePrice: 320000,
        originalPrice: 320000,
        bookingAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           pincode: '122011',
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA' },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.16Z',
        userDetailsSubmitted: false,
        userVariant: 'B',
        pincodeServiceable: true,
        deliveryTime: 
         { date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500',
                empty: false } ],
           empty: false },
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        hubCode: 'LC_19',
        carCityId: 5,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        reservationDetail: 
         { reservationCityMode: 'NO_RESERVE',
           reservationChargesCategory: 'FREE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        listingDiscountCoupons: [],
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        nonReserveTokenDone: false,
        isReschedule: false,
        pvtTokenAmount: 0,
        orderVisited: false },
     extraInfo: { appLink: 'https://cars24.app.link/T1OOgRQyxIb' },
     serviceRequest: 
      { id: '69afcfe6d0949a3eb7d720b5',
        orderId: 'AP9B7J',
        serviceRequestId: 'AP9B7J-SR-1',
        deliveryMode: 'VIDEO',
        slotStartTime: 1773133200000,
        slotEndTime: 1773135000000,
        status: 'CREATED',
        offeringConfig: 
         { offeringId: 'VIDEO_CALL_LIVE_FREE',
           type: 'VIDEO',
           title: 'Live video car demo',
           amount: 99,
           finalAmount: 0,
           refundable: true,
           enabled: true,
           limitPerMonth: 4,
           sortingOrder: 3 },
        isReschedule: true,
        createdAt: '2026-03-10T08:01:42.069',
        updatedAt: '2026-03-10T08:33:43.073' },
     data: 
      [ { key: 'TEST_DRIVE_HEADER',
          viewType: 'TEST_DRIVE_HEADER_VIEWTYPE',
          data: 
           { background: 'linear-gradient(0deg,  #016630 -5.72%,  #00A63E 64.52%)',
             darkBgHeader: true,
             backgroundGradient: [ '#016630', '#00A63E' ],
             stickyHeaderBackground: '#00A63E',
             title: 'Video demo booked',
             leftIcon: { icon: 'arrow-left-outline', theme: 'dark' },
             rightIcon: 
              { icon: 'share-1',
                theme: 'dark',
                redirection: 
                 { action: 'SHARE',
                   data: { template: 'I’ve scheduled a *Video Call Test Drive* for this car and wanted to share the details 👇\n🚗 Car: *2014 Toyota Innova*\n⭐ Priced at: 3.20 lakh\n📅 Test drive details: 10 Mar at 2:30 PM - 3:00 PM\n\nCheck out this car!\nhttps://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923' } } },
             carStateCard: 
              { primaryTitle: { text: 'Your video demo will', color: '#0F172B' },
                secondaryTitle: { text: 'start at 2:30 PM today', color: '#368C61' },
                subTitle: { text: 'We will assign you an expert soon', color: '#62748E' },
                borderColor: '#C4D6E5',
                media: 
                 { url: 'https://media.cars24.com/india/buy/bof/video-call/Calendar.png',
                   alt: 'car-image',
                   type: 'image' },
                cornerBadge: { url: 'https://media.cars24.com/india/buy/bof/video-call/ConfirmedBagde.png' },
                footer: 
                 { ctas: 
                    [ { text: 'Join video call',
                        type: 'PRIMARY',
                        disable: true,
                        redirection: 
                         { action: 'WEB_VIEW',
                           data: 
                            { appRedirection: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}',
                              url: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}' } },
                        fixedCta: false } ] } },
             carDetailCard: 
              { title: { text: '2014 Toyota Innova', color: '#FFFFFF' },
                subTitle: 
                 { text: '2.5 VX 8 STR BS IV • 3.20 lakh',
                   color: 'rgba(255, 255, 255, 0.80)' },
                media: 
                 { alt: 'car-image',
                   type: 'image',
                   overlayImage: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format' },
                background: 'rgba(0, 0, 0, 0.10)',
                borderColor: 'rgba(255, 255, 255, 0.40)',
                cta: 
                 { text: 'View this car',
                   type: 'WHITE',
                   underLine: false,
                   rightIcon: { icon: 'arrow-right-outline', color: '#FFFFFF' },
                   redirection: 
                    { action: 'DEEP_LINK',
                      data: 
                       { appRedirection: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true&source=video-thankyou',
                         url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true' } },
                   fixedCta: false } } } },
        { key: 'OTHER_OFFERINGS_CARD',
          viewType: 'OTHER_OFFERINGS_CARD_VIEWTYPE',
          widgetHeader: 
           { title: 'More test drive options for you',
             description: 'Experience this car in person before buying' },
          data: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
        [TOO BIG formatValueCalls 202 exceeded limit of 200],
        [TOO BIG formatValueCalls 203 exceeded limit of 200],
        [TOO BIG formatValueCalls 204 exceeded limit of 200] ] },
  status: [TOO BIG formatValueCalls 205 exceeded limit of 200] }
ScreenView [0] setFrame: {{0, 0}, {393, 852}}
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
Warning: A props object containing a "key" prop is being spread into JSX:
  let props = {key: someKey, content: ..., viewType: ..., data: ..., cardKey: ..., onCalendarEvent: ..., pageName: ..., eventLabel: ...};
  <ActionGridWidget {...props} />
React keys must be passed directly to JSX without using spread:
  let props = {content: ..., viewType: ..., data: ..., cardKey: ..., onCalendarEvent: ..., pageName: ..., eventLabel: ...};
  <ActionGridWidget key={someKey} {...props} />
    in CellRenderer (created by VirtualizedList)
    in RCTScrollContentView (created by ScrollView)
    in RCTScrollView (created by ScrollView)
    in ScrollView (created by ScrollView)
    in Wrapper (created by VirtualizedList)
    in VirtualizedListContextProvider (created by VirtualizedList)
    in VirtualizedList (created by FlatList)
    in FlatList (created by TestDriveBookingConfirmPage)
    in RCTView (created by View)
    in View (created by ConfirmationPageRenderEngine)
    in RCTScrollContentView (created by ScrollView)
    in RCTScrollView (created by ScrollView)
    in ScrollView (created by ScrollView)
    in Wrapper (created by AnimatedComponent(ScrollView))
    in AnimatedComponent(ScrollView)
    in Unknown
    in Unknown (created by ConfirmationPageRenderEngine)
    in RCTView (created by View)
    in View (created by ConfirmationPageRenderEngine)
    in ConfirmationPageRenderEngine (created by TestDriveBookingConfirmPage)
    in RCTView (created by View)
    in View (created by TestDriveBookingConfirmPage)
    in TestDriveBookingConfirmPage
    in ThemeProvider
    in Unknown (created by SceneView)
    in StaticContainer
    in EnsureSingleNavigator (created by SceneView)
    in SceneView (created by SceneView)
    in RCTView (created by View)
    in View (created by DebugContainer)
    in DebugContainer (created by MaybeNestedStack)
    in MaybeNestedStack (created by SceneView)
    in RCTView (created by View)
    in View (created by SceneView)
    in RNSScreen (created by Animated(Anonymous))
    in Animated(Anonymous)
    in Suspender (created by Freeze)
    in Suspense (created by Freeze)
    in Freeze (created by DelayedFreeze)
    in DelayedFreeze
    in InnerScreen (created by Screen)
    in Screen (created by SceneView)
    in SceneView (created by NativeStackViewInner)
    in RNSScreenStack (created by ScreenStack)
    in Unknown (created by ScreenStack)
    in ScreenStack (created by NativeStackViewInner)
    in NativeStackViewInner (created by NativeStackView)
    in RCTView (created by View)
    in View (created by SafeAreaProviderCompat)
    in SafeAreaProviderCompat (created by NativeStackView)
    in NativeStackView (created by NativeStackNavigator)
    in PreventRemoveProvider (created by NavigationContent)
    in NavigationContent
    in Unknown (created by NativeStackNavigator)
    in NativeStackNavigator
    in NavigationTracker
    in Unknown
    in TracerProvider
    in EnsureSingleNavigator
    in BaseNavigationContainer
    in ThemeProvider
    in NavigationContainerInner
    in Unknown (created by NavContainer)
    in NavContainer (created by Startup)
    in Unknown (created by Startup)
    in Unknown (created by Startup)
    in RCTView (created by View)
    in View (created by Startup)
    in Startup (created by App)
    in QueryClientProvider (created by PersistQueryClientProvider)
    in PersistQueryClientProvider (created by App)
    in RCTView (created by View)
    in View (created by GestureHandlerRootView)
    in GestureHandlerRootView (created by App)
    in PersistGate (created by App)
    in Provider (created by App)
    in RNCSafeAreaProvider (created by SafeAreaProvider)
    in SafeAreaProvider (created by App)
    in App (created by StallionProvider)
    in GlobalProvider (created by StallionProvider)
    in ErrorBoundary (created by StallionProvider)
    in StallionProvider
    in RCTView (created by View)
    in View (created by AppContainer)
    in RCTView (created by View)
    in View (created by AppContainer)
    in AppContainer
    in cars24CustomerApp(RootComponent)
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
'@RnSuperapp | Tracker -> ', { event: 
   { name: 'widget_viewed',
     data: 
      { eventAction: 'widget_viewed',
        eventCategory: 'video_demo_booking_page',
        eventLabel: 'CTA_PLACEHOLDER_CARD | CREATED | AP9B7J | -- | Start instant video call',
        source: 'app' } },
  type: 'everythingExceptCleverTap' }
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
Unrecognized font family 'Geist SemiBold Regular'
Unrecognized font family 'Geist SemiBold Regular'
Unrecognized font family 'Geist Medium Regular'
Unrecognized font family 'Geist Medium Regular'
Unrecognized font family 'Geist SemiBold Regular'
Unrecognized font family 'Geist Bold Regular'
Unrecognized font family 'Geist Bold Regular'
Unrecognized font family 'Geist Bold Regular'
Unrecognized font family 'Geist Regular'
Unrecognized font family 'Geist Regular'
Unrecognized font family 'Geist Regular'
Unrecognized font family 'Geist Regular'
Unrecognized font family 'Geist SemiBold Regular'
Unrecognized font family 'Geist SemiBold Regular'
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
'fetchedPostCheckoutData', { data: 
   { order: 
      { id: '69afcfd6d0949a3eb7d720b2',
        userId: '55e2c318-e242-45d3-aead-30dce37e3fd5',
        clientId: 'd54b89ad-bbb5-44e9-9f78-4536d279c533',
        orderId: 'AP9B7J',
        userLocation: '122007',
        appointmentId: '4450501923',
        storeId: '19',
        totalAmount: 320000,
        vehiclePrice: 320000,
        originalPrice: 320000,
        bookingAmount: 0,
        currency: 'INR',
        vehicleType: 'car',
        status: 'BOOKED',
        country: 'IN',
        financeOpted: false,
        finalFinanceTermsAccepted: false,
        deliveryAddress: 
         { addressLine1: 'Cars24- Baani City, Sector-63, Gurugram,',
           addressLine2: 'Basement 1 & 2, Bani City Centre, Sector 63, Gurugram, Haryana 122011',
           landmark: '',
           pincode: '122011',
           latitude: '28.40025',
           longitude: '77.0865',
           mapLink: 'https://maps.app.goo.gl/m8pQW8DBbMZ5QZbeA' },
        deliveryMode: 'VIDEO',
        pickupStoreId: '19',
        bookingConfirmDate: '2026-03-10T08:01:42.31Z',
        bookingExpireDate: '2026-03-24T09:00:00Z',
        createdDate: '2026-03-10T08:01:26.688Z',
        modifiedDate: '2026-03-10T08:33:43.16Z',
        userDetailsSubmitted: false,
        userVariant: 'B',
        pincodeServiceable: true,
        deliveryTime: 
         { date: '2026-03-10',
           dayOfTheWeek: 'Tue',
           dayOfTheMonth: 10,
           displayMonth: 'Mar',
           slots: 
            [ { startAt: 1773133200000,
                endAt: 1773135000000,
                from: '02:30',
                to: '03',
                suffix: 'PM',
                toSuffix: 'PM',
                display: '02:30 PM - 03 PM',
                slotKey: '1430_1500',
                empty: false } ],
           empty: false },
        orderCancelRating: 0,
        deliveryPickupVariant: 'B',
        fasterCheckout: false,
        paymentMethodType: 'razorpay',
        source: 'MobileApp',
        hubCode: 'LC_19',
        carCityId: 5,
        experimentVariant: 
         { bc2v_gate: true,
           financeVariant: 'C',
           testDriveVariant: 'A',
           reservationOptionsScreen: 'A',
           loginFlow: 'V1',
           initiateBookingVariant: 'B',
           bi2bcExperiment: true,
           thankYouPageExperiment: true,
           financeOptionScreen: 'B',
           netbankingVariant: 'B',
           freePaidScreen: 'A',
           fasterCheckoutBanking: 'A',
           testDriveRuleExperiment: true,
           orderSummaryVariant: 'A',
           skipHomeTestDrive: false,
           multipleBookingAllowed: 'true',
           bookingAmountForPaidBooking: 199 },
        reservationDetail: 
         { reservationCityMode: 'NO_RESERVE',
           reservationChargesCategory: 'FREE',
           reservationMode: 'NO_RESERVE',
           userOpted: true },
        listingDiscountCoupons: [],
        valueAddedServices: [ { productId: 'warranty_c1_p12_4450501923', mandatory: true } ],
        visitId: '55e2c318-e242-45d3-aead-30dce37e3fd5_19_10_03_2026_1400_1430',
        nonReserveTokenDone: false,
        isReschedule: false,
        pvtTokenAmount: 0,
        orderVisited: false },
     extraInfo: { appLink: 'https://cars24.app.link/T1OOgRQyxIb' },
     serviceRequest: 
      { id: '69afcfe6d0949a3eb7d720b5',
        orderId: 'AP9B7J',
        serviceRequestId: 'AP9B7J-SR-1',
        deliveryMode: 'VIDEO',
        slotStartTime: 1773133200000,
        slotEndTime: 1773135000000,
        status: 'CREATED',
        offeringConfig: 
         { offeringId: 'VIDEO_CALL_LIVE_FREE',
           type: 'VIDEO',
           title: 'Live video car demo',
           amount: 99,
           finalAmount: 0,
           refundable: true,
           enabled: true,
           limitPerMonth: 4,
           sortingOrder: 3 },
        isReschedule: true,
        createdAt: '2026-03-10T08:01:42.069',
        updatedAt: '2026-03-10T08:33:43.073' },
     data: 
      [ { key: 'TEST_DRIVE_HEADER',
          viewType: 'TEST_DRIVE_HEADER_VIEWTYPE',
          data: 
           { background: 'linear-gradient(0deg,  #016630 -5.72%,  #00A63E 64.52%)',
             darkBgHeader: true,
             backgroundGradient: [ '#016630', '#00A63E' ],
             stickyHeaderBackground: '#00A63E',
             title: 'Video demo booked',
             leftIcon: { icon: 'arrow-left-outline', theme: 'dark' },
             rightIcon: 
              { icon: 'share-1',
                theme: 'dark',
                redirection: 
                 { action: 'SHARE',
                   data: { template: 'I’ve scheduled a *Video Call Test Drive* for this car and wanted to share the details 👇\n🚗 Car: *2014 Toyota Innova*\n⭐ Priced at: 3.20 lakh\n📅 Test drive details: 10 Mar at 2:30 PM - 3:00 PM\n\nCheck out this car!\nhttps://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923' } } },
             carStateCard: 
              { primaryTitle: { text: 'Your video demo will', color: '#0F172B' },
                secondaryTitle: { text: 'start at 2:30 PM today', color: '#368C61' },
                subTitle: { text: 'We will assign you an expert soon', color: '#62748E' },
                borderColor: '#C4D6E5',
                media: 
                 { url: 'https://media.cars24.com/india/buy/bof/video-call/Calendar.png',
                   alt: 'car-image',
                   type: 'image' },
                cornerBadge: { url: 'https://media.cars24.com/india/buy/bof/video-call/ConfirmedBagde.png' },
                footer: 
                 { ctas: 
                    [ { text: 'Join video call',
                        type: 'PRIMARY',
                        disable: true,
                        redirection: 
                         { action: 'WEB_VIEW',
                           data: 
                            { appRedirection: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}',
                              url: 'null&utm_source=app&umsAuthCode=~{umsAuthCodeQuery}' } },
                        fixedCta: false } ] } },
             carDetailCard: 
              { title: { text: '2014 Toyota Innova', color: '#FFFFFF' },
                subTitle: 
                 { text: '2.5 VX 8 STR BS IV • 3.20 lakh',
                   color: 'rgba(255, 255, 255, 0.80)' },
                media: 
                 { alt: 'car-image',
                   type: 'image',
                   overlayImage: 'https://media.cars24.com/hello-ar/dev/uploads/no_bg/c55bd976-0ed0-11ef-bd33-02ede2007fbe/663e1f143a24b0d05144ec17/fefb92a9-a1d1-4d2e-8b09-dc80ec490ae7/slot/10002384763-75fb17c493634fde82283855a5bfdf65-Exterior-7.png?w=250&auto=format' },
                background: 'rgba(0, 0, 0, 0.10)',
                borderColor: 'rgba(255, 255, 255, 0.40)',
                cta: 
                 { text: 'View this car',
                   type: 'WHITE',
                   underLine: false,
                   rightIcon: { icon: 'arrow-right-outline', color: '#FFFFFF' },
                   redirection: 
                    { action: 'DEEP_LINK',
                      data: 
                       { appRedirection: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true&source=video-thankyou',
                         url: 'https://stage-catalog-india-website.qac24svc.dev/buy-used-toyota-innova-2014-cars-gurgaon-4450501923?hideLoader=true' } },
                   fixedCta: false } } } },
        { key: 'OTHER_OFFERINGS_CARD',
          viewType: 'OTHER_OFFERINGS_CARD_VIEWTYPE',
          widgetHeader: 
           { title: 'More test drive options for you',
             description: 'Experience this car in person before buying' },
          data: [TOO BIG formatValueCalls 201 exceeded limit of 200] },
        [TOO BIG formatValueCalls 202 exceeded limit of 200],
        [TOO BIG formatValueCalls 203 exceeded limit of 200],
        [TOO BIG formatValueCalls 204 exceeded limit of 200] ] },
  status: [TOO BIG formatValueCalls 205 exceeded limit of 200] }
GoogleTagManager warning: Event does not have parameter "eventCategory" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension91" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "booking_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension95" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "appointment_id" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension116" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "mobile_last_digit" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension143" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension140" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension144" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension145" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension147" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension122" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension88" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension146" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "userId" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension148" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension141" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension117" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension118" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension152" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension153" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension154" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension150" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension151" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension89" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension90" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "logged_in" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension83" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "days_after_delivery" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "number_of_cars" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension164" and no default value was defined. Returning "undefined".
GoogleTagManager warning: Event does not have parameter "dimension167" and no default value was defined. Returning "undefined".
GoogleTagManager error: UniversalAnalytics tag is no longer supported.
'@RnSuperapp | Tracker -> ', { event: 
   { name: 'widget_viewed',
     data: 
      { eventAction: 'widget_viewed',
        eventCategory: 'video_demo_booking_page',
        eventLabel: 'ACTION_PLACEHOLDER_CARD | -- | AP9B7J | 3 | Cancel, Reschedule, Set Reminder',
        source: 'app' } },
  type: 'everythingExceptCleverTap' }
nw_socket_handle_socket_event [C945.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C945.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C945.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C945.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C945.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C945] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c26c0 Failed : error 0:61 [61]
I0310 14:03:50.139868 1824960512 JSIExecutor.cpp:354] Memory warning (pressure level: TRIM_MEMORY_RUNNING_CRITICAL) received by JS VM, running a GC
nw_socket_handle_socket_event [C946.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C946.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C946.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C946.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C946.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C946] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300732120 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C947.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C947.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C947.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C947.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C947.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C947] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004f0c0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C948.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C948.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C948.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C948.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C948.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C948] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004a440 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C949.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C949.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C949.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C949.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C949.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C949] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0b40 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C950.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C950.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C950.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C950.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C950.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C950] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1360 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C951.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C951.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C951.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C951.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C951.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C951] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c15e0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C952.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C952.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C952.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C952.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C952.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C952] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300731cc0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C953.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C953.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C953.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C953.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C953.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C953] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ad00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C954.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C954.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_connect [C954.1.2:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=127.0.0.1:8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C954.1.2:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C954.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C954.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C954] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1540 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C955.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C955.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C955.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C955.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C955.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C955] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004bde0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C956.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C956.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C956.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C956.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C956.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C956] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ad00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C957.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C957.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C957.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C957.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C957.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C957] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c15e0 Failed : error 0:61 [61]
tcp_input [C875.1.1.1:3] flags=[R] seq=1318743039, ack=0, win=0 state=LAST_ACK rcv_nxt=1318743039, snd_una=754702366
tcp_input [C875.1.1.1:3] flags=[R] seq=1318743039, ack=0, win=0 state=CLOSED rcv_nxt=1318743039, snd_una=754702366
tcp_input [C875.1.1.1:3] flags=[R] seq=1318743039, ack=0, win=0 state=CLOSED rcv_nxt=1318743039, snd_una=754702366
nw_socket_handle_socket_event [C960.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C960.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C960.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C960.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C960.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C960] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ec60 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C961.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C961.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C961.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C961.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C961.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C961] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0b40 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C962.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C962.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C962.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C962.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C962.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C962] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0b40 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C963.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C963.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C963.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C963.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C963.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C963] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c15e0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C964.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C964.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C964.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C964.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C964.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C964] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ef80 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C965.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C965.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C965.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C965.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C965.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C965] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300731220 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C966.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C966.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C966.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C966.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C966.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C966] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300730d20 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C967.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C967.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C967.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C967.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C967.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C967] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3007308c0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C968.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C968.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C968.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C968.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C968.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C968] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004f200 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C969.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C969.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C969.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C969.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C969.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C969] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300732260 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C970.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C970.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C970.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C970.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C970.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C970] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c320 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C971.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C971.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C971.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C971.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C971.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C971] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300731400 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C972.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C972.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C972.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C972.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C972.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C972] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0b40 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C973.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C973.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C973.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C973.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C973.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C973] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c26c0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C974.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C974.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C974.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C974.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C974.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C974] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1400 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C975.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C975.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C975.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C975.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C975.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C975] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c320 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C976.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C976.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_connect [C976.1.2:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=127.0.0.1:8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C976.1.2:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C976.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C976.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C976] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ef80 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C977.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C977.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C977.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C977.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C977.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C977] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1180 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C978.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C978.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C978.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C978.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C978.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C978] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300049f40 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C979.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C979.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C979.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C979.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C979.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C979] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ec60 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C980.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C980.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C980.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C980.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C980.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C980] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c320 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C981.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C981.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C981.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C981.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C981.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C981] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ef80 Failed : error 0:61 [61]
tcp_input [C938.1.1.1:3] flags=[R.] seq=758413028, ack=3846371674, win=303 state=LAST_ACK rcv_nxt=758413028, snd_una=3846371611
tcp_input [C938.1.1.1:3] flags=[R] seq=758413028, ack=0, win=0 state=CLOSED rcv_nxt=758413028, snd_una=3846371611
nw_socket_handle_socket_event [C982.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C982.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C982.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C982.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C982.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C982] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004f200 Failed : error 0:61 [61]
nw_socket_connect [C983.1.1:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=::1.8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C983.1.1:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C983.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C983.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C983.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C983.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C983] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004e580 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C984.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C984.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C984.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C984.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C984.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C984] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300732260 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C985.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C985.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C985.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C985.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C985.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C985] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300732260 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C986.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C986.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C986.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C986.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C986.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C986] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0be0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C987.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C987.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C987.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C987.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C987.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C987] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300049e00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C988.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C988.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C988.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C988.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C988.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C988] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300049e00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C991.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C991.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C991.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C991.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C991.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C991] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c0a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C992.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C992.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C992.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C992.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C992.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C992] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ad00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C993.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C993.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C993.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C993.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C993.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C993] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c500 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C994.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C994.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C994.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C994.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C994.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C994] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004bb60 Failed : error 0:61 [61]
nw_socket_connect [C995.1.1:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=::1.8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C995.1.1:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C995.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C995.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C995.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C995.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C995] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004bb60 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C996.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C996.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C996.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C996.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C996.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C996] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c0a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C997.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C997.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C997.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C997.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C997.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C997] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0a00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C998.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C998.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C998.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C998.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C998.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C998] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c2300 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C999.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C999.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C999.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C999.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C999.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C999] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ad00 Failed : error 0:61 [61]
nw_socket_connect [C1000.1.1:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=::1.8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C1000.1.1:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1000.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1000.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1000.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1000.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1000] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c08c0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1001.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1001.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1001.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1001.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1001.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1001] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0d20 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1002.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1002.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1002.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1002.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1002.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1002] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300731040 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1003.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1003.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1003.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1003.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1003.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1003] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004eee0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1004.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1004.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1004.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1004.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1004.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1004] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004e120 Failed : error 0:61 [61]
nw_path_necp_check_for_updates Failed to copy updated result (22)
nw_socket_handle_socket_event [C1005.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1005.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1005.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1005.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1005.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1005] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ef80 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1006.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1006.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1006.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1006.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1006.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1006] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1540 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1007.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1007.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1007.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1007.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1007.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1007] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c2940 Failed : error 0:61 [61]
nw_socket_connect [C1008.1.1:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=::1.8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C1008.1.1:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1008.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1008.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1008.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1008.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1008] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1540 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1009.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1009.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_connect [C1009.1.2:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=127.0.0.1:8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C1009.1.2:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1009.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1009.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1009] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1540 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1010.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1010.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1010.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1010.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1010.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1010] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c1540 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1011.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1011.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1011.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1011.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1011.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1011] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300049220 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1012.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1012.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1012.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1012.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1012.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1012] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c0a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1013.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1013.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1013.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1013.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1013.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1013] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c0a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1014.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1014.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1014.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1014.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1014.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1014] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300730280 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1015.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1015.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1015.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1015.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1015.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1015] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300049ea0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1016.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1016.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1016.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1016.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1016.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1016] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c0a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1017.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1017.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1017.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1017.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1017.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1017] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004eee0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1018.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1018.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1018.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1018.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1018.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1018] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000c0500 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1021.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1021.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1021.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1021.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1021.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1021] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300056580 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1022.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1022.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1022.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1022.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1022.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1022] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004c000 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1023.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1023.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1023.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1023.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1023.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1023] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300055ea0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1024.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1024.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1024.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1024.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1024.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1024] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3007319a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1025.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1025.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1025.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1025.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1025.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1025] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300731e00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1026.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1026.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1026.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1026.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1026.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1026] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004e760 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1027.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1027.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1027.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1027.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1027.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1027] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300056c60 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1028.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1028.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1028.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1028.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1028.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1028] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004eee0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1029.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1029.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1029.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1029.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1029.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1029] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000930c0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1030.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1030.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1030.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1030.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1030.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1030] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004ed00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1031.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1031.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1031.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1031.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1031.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1031] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3000923a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1032.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1032.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1032.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1032.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1032.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1032] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x3007319a0 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1033.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1033.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1033.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1033.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1033.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1033] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300054a00 Failed : error 0:61 [61]
nw_socket_handle_socket_event [C1034.1.1:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1034.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_connect [C1034.1.2:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=127.0.0.1:8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C1034.1.2:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1034.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1034.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1034] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x300054a00 Failed : error 0:61 [61]
nw_socket_connect [C1035.1.1:1] connectx(36, [srcif=0, srcaddr=<NULL>, dstaddr=::1.8081], SAE_ASSOCID_ANY, 0, NULL, 0, NULL, SAE_CONNID_ANY) failed: [61: Connection refused]
nw_socket_connect [C1035.1.1:1] connectx failed (fd 36) [61: Connection refused]
nw_socket_connect connectx failed [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1035.1.1 ::1.8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_socket_handle_socket_event [C1035.1.2:1] Socket SO_ERROR [61: Connection refused]
nw_endpoint_flow_failed_with_error [C1035.1.2 127.0.0.1:8081 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] already failing, returning
nw_endpoint_flow_failed_with_error [C1035.1.2 127.0.0.1:8081 cancelled socket-flow ((null))] already failing, returning
nw_connection_get_connected_socket_block_invoke [C1035] Client called nw_connection_get_connected_socket on unconnected nw_connection
TCP Conn 0x30004dd60 Failed : error 0:61 [61]