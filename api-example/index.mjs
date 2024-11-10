import { createServer } from 'node:http';

const HOST = '0.0.0.0';
const PORT = '3000';

const server = createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello from Azure Container Instance!\n');
});

server.listen(PORT, HOST, () => {
    console.log(`Listening on ${HOST}:${PORT}`);
});
