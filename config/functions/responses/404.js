'use strict';

module.exports = async ( ctx ) => {
  return ctx.notFound('URL not found (404)');
};
