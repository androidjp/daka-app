'use strict';

var _express = require('express');

var _express2 = _interopRequireDefault(_express);

var _bodyParser = require('body-parser');

var _bodyParser2 = _interopRequireDefault(_bodyParser);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var app = (0, _express2.default)();
var router = _express2.default.Router();

//---------------------------------------------------------

app.all('*', function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

app.use(_bodyParser2.default.json());
app.use(_bodyParser2.default.urlencoded({ extended: false }));

//---------------------------------------------------------
var records = [{
    id: '1',
    title: 'title1',
    type: 0,
    duringTime: '1h'
}, {
    id: '2',
    title: 'title2',
    type: 1,
    duringTime: '1h'
}, {
    id: '3',
    title: 'title3',
    type: 2,
    duringTime: '1h'
}];

router.route('/GET/recordList').get(function (req, res, next) {
    res.json(records);
});

app.use('/api', router);

//---------------------------------------------------------

app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

app.use(function (err, req, res, next) {
    var json = {};
    json.message = err.message;
    json.status = err.status ? err.status : 500;
    // render the error page
    res.status(err.status || 500);
    res.json(json);
});

//---------------------------------------------------------


app.listen(8666, function () {
    console.log('App listening on port 8666!');
});