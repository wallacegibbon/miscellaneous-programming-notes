/// JSONP need special handling on the server side.

/// assume the page is like this:
//  <script>
//    /// this function will be called by the script returned by server
//    function myfunc(result) { alert(result); }
//  </script>
//  <script src="http://crossdomain.com/blah?jsonp=myfunc"></script>
