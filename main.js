const Hapi = require('hapi');

const server = new Hapi.Server();
server.connection({
    host: '0.0.0.0',
    port: 8080
});

server.route({
    path: '/',
    method: 'GET',
    handler: (req, reply) => {
        reply('Hello!');
    }
});

server.start(err => {
    if (err) {
        console.log(err);
        process.exit(1);
    }
    console.log('Listening on 0.0.0.0:8080');
});