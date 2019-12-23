function FindProxyForURL(url, host) {
    var proxy = "SOCKS5 5.8.13.74:8000";
    
    var patterns = ["2ip.ru",
                    "rutor.info",
                    "free-rutor.org",
                    "film-tor.info",
                    "*atlassian*",
                    "*slack*",
                    "*rollbar.com",
                    "*zoom.com",
                    "*confluence*",
                    "*fabric.io",
                    "*firebase*",
                    "*lostfilm.tv"];
    
    for (regex of patterns) {
        if (shExpMatch(host, regex))
            return proxy;
    }
    
    return "DIRECT";
}
