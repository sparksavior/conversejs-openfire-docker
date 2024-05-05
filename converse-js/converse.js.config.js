// Replace 'matrix' with the name or IP address of your Matrix server container
const MATRIX_CONTAINER_NAME = 'localhost';

module.exports = {
    bosh_service_url: `http://${MATRIX_CONTAINER_NAME}:8008/_matrix/client/r0/`,
    websocket_url: `ws://${MATRIX_CONTAINER_NAME}:8008/_matrix/client/r0/`,
    authentication: 'login'
};

