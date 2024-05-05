// Replace 'prosody' with the name or IP address of your Prosody container
const PROSODY_CONTAINER_NAME = 'prosody_container';

module.exports = {
    bosh_service_url: `https://${PROSODY_CONTAINER_NAME}:5280/http-bind`,
    websocket_url: `wss://${PROSODY_CONTAINER_NAME}:5443/ws`,
    credentials_url: `https://${PROSODY_CONTAINER_NAME}:5443/api/credentials`,
    authentication: 'login'
};

converse.initialize({
    websocket_url: 'wss://prosody_container:5443/ws',
   // websocket_url: 'ws://{PROSODY_CONTAINER_NAME}:5280/xmpp-websocket',
    // Other Converse.js configuration options
});