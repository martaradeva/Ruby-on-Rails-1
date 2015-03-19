Perhaps a decent and detailed explanation can be found [here](https://github.com/alex/what-happens-when).

 "+"marks answers that I added after reading the above text.

* + Is it a url or a search term?
* + Browser parses URL and sends reqest via HTTPS protocol
* DNS lookup. Browser checks if domain in cache, if not, requests address form the DNS server.
* GET https://hackbulgaria.com -> 200OK
* + parsing HTML
* Load required assets via GET - CSS, static images, javascripts. 200OK on initial load, 304 Not Modified on reload.
* hackbulgaria.com is using foundation CSS framework and related foundation.min.js (foundation core and JavaScript plugins.)
* is collecting statistic data via google analytics.js.
* + parsing CSS.
* + page rendering.