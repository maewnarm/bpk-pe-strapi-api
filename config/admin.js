module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '36f0b67a861ad23e46c73d516ffcf5e4'),
  },
});
