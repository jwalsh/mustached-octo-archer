// Verify a generic server-to-server call for WePay

var wepay = require('../node_modules/wepay').WEPAY;

var wepay_settings = {
  'client_id' : process.env.CLIENT,
  'client_secret' : process.env.SECRET,
  'access_token' : process.env.TOKEN
};

var wp = new wepay(wepay_settings);
wp.use_staging(); // use staging environment (payments are not charged)
wp.call(
  '/checkout/create',
  {
    'account_id': process.env.ACCOUNT,
    'short_description': 'Selling 42 Pens',
    'type': 'GOODS',
    'amount': 50
  },
  function(response) {
    console.log('%s', response);
  }
);
