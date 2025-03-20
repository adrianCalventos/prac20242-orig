import { serve, SQL } from 'bun';
import Homepage from './index.html';

const db = new SQL({
  hostname: process.env.POSTGRES_HOST ?? "localhost",
  port: 5432,
  database: process.env.POSTGRES_DB ?? "dbname",
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  onconnect: () => {
    console.log("Connected to database");
  },
  onclose: () => {
    console.log("Connection closed");
  },
});

const server = serve({
  development: true,
  routes: {
    '/': Homepage,
    '/api/recipes': {
      async GET() {
        const recipes = await db`SELECT * FROM recipes`;
        const response = {
          receipts: recipes,
          student: process.env.POSTGRES_USER,
          created: new Date().toISOString(),
        }
        return Response.json(response);
      }
    }
  }
})

console.log(`Listening on ${server.url}`);
