import fp from 'fastify-plugin';
import { FastifyInstance } from 'fastify';
import { UserController } from './user.controller';

export default fp(async (fastify: FastifyInstance) => {
  fastify.get('/users', new UserController().exec);
});
