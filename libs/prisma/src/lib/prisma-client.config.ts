export interface PrismaClientConfig {
  databaseUrl: string;
  logging: "all_queries" | "long_queries";
  maxQueryExecutionTime: number;
}
