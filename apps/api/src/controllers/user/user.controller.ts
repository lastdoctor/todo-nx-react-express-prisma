import { FastifyReply, FastifyRequest } from 'fastify';

export class UserController {
  exec = (req: FastifyRequest, rep: FastifyReply) => {
    console.log(req);
    console.log(rep);
    rep.send('users')
  };
}
