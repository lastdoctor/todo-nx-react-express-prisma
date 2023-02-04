import { PrismaClient } from "@prisma/client";
import * as process from "process";

const DATABASE_URL = process.env.DATABASE_URL;

export class PrismaClientService extends PrismaClient {
  static instance: PrismaClientService;

  constructor() {
    super({
      datasources: {
        db: {
          url: DATABASE_URL
        }
      },
      log: [
        {
          emit: "event",
          level: "query"
        },
        {
          emit: "event",
          level: "error"
        }
      ]
    });
    PrismaClientService.instance = this;
  }
}
