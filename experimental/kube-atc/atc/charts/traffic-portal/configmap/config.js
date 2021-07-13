module.exports = {
    timeout: '120s',
    useSSL: false, // set to true if you plan to use https (self-signed or trusted certs).
    port: 80, // set to http port
    sslPort: 443, // set to https port
    // if useSSL is true, generate ssl certs and provide the proper locations.
    ssl: {
        key:    '/etc/pki/tls/private/localhost.key',
        cert:   '/etc/pki/tls/certs/localhost.crt',
        ca:     [ '/etc/pki/tls/certs/ca-bundle.crt' ]
    },
    // set api 'base_url' to the traffic ops api url (all api calls made from the traffic portal will be proxied to the api base_url)
    api: {
        base_url: 'http://localhost:8001/api/v1/namespaces/{{ .Release.Namespace }}/services/http:{{ .Release.Name }}-traffic-portal:8080/proxy/'
    },
    // default static files location (this is where the traffic portal html, css and javascript was installed. rpm installs these files at /opt/traffic_portal/public
    files: {
        static: '/opt/traffic_portal/public'
    },
    // default log location (this is where traffic_portal logs are written)
    log: {
        stream: '/var/log/traffic_portal/access.log'
    },
    reject_unauthorized: 0 // 0 if using self-signed certs, 1 if trusted certs
};