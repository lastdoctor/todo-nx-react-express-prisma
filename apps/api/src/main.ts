import * as express from "express";
import { Message } from "@todo-nx-react-express-prisma/api-interfaces";
import { PrismaClientService } from "../../../libs/prisma/src/lib/prisma-client.service";

const app = express();

const greeting: Message = { message: "Welcome to api!" };


app.get("/api", async (req, res) => {
  const prisma = new PrismaClientService();
  const result = await prisma.$queryRaw`SELECT * FROM users;`
  console.log(result);
  res.send(greeting);
});

const port = process.env.port || 3333;
const server = app.listen(port, () => {
  console.log("Listening at http://localhost:" + port + "/api");
});
server.on("error", console.error);
