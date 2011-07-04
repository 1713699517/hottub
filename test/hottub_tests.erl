-module(hottub_tests).
-include_lib("eunit/include/eunit.hrl").

pool_test() ->
    ?debugHere,
    hottub:start(test_pool, 1, test_worker, start_link, []),
    ?debugHere,
    timer:sleep(20),
    Pid = hottub:worker(test_pool),
    ?assertEqual(true, is_pid(Pid)),
    test_worker:crash(Pid),
    timer:sleep(20),
    ?assertEqual(true, is_pid(hottub:worker(test_pool))),
    ?debugHere,
    ok.
