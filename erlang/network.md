## Use http client in OTP

```erlang
httpc:request(post, {"https://google.com",  [{"token", "xxx"}], "", <<"body">>}, [{timeout, 3000}], [{body_format, binary}, {full_result, false}]).
%> {error,{failed_connect,[{to_address,{"google.com",443}},
%			{inet,[inet],timeout}]}}

httpc:request(get, {"https://google.com", []}, [{timeout, 3000}], [{body_format, binary}, {full_result, false}]).
%> {error,{failed_connect,[{to_address,{"google.com",443}},
%			{inet,[inet],timeout}]}}

httpc:request(get, {"https://baidu.com", []}, [{timeout, 3000}], [{body_format, binary}, {full_result, false}]).
%> {ok,{200,
%     <<"<!DOCTYPE html>\r\n<html>\r\n<head>\n\t"...>>}}
```

The `content-type` is not to be put into the headers list, but as the 3rd element of the 2nd argument of httpc:request

```erlang
httpc:request(post, {"https://blah.com", [], "application/json", <<"{\"a\":1}">>}, [], []).
```


## The following situation could be a bug (in OTP21)

heads in httpc:request should be `[{string(),string()},...]`,

```erlang
httpc:request(get, {"http://google.com", [{"token", <<1, 2, 3>>}]}, [], []).
%> {error,{headers_error,not_strings}}
```

Nothing special~

But when the request is POST and headers are invalid, things goes wrong:

```erlang
httpc:request(post, {"http://google.com", [{"token", <<1, 2, 3>>}], "", <<>>}, [], []).
%  =CRASH REPORT==== 11-Dec-2020::17:54:26.501135 ===
%  ...
%	          exception error: bad argument
%		        in operator  ++/2
%			         called as <<1,2,3>> ++ "\r\n"
%
%  (and the shell is dead now)

