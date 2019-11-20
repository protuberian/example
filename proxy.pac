function FindProxyForURL(url, host) {
    var proxy = "PROXY 5.8.13.74:8000";
    
    var patterns = ["2ip.ru",
                    "rutor.info",
                    "free-rutor.org",
                    "*atlassian*",
                    "*slack*",
                    "*rollbar.com",
                    "*zoom.com",
                    "*confluence*"];
    
    for (regex of patterns) {
        if (shExpMatch(host, regex))
            return proxy;
    }
    
    return "DIRECT";
}
