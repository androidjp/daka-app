'use strict';

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _express = require('express');

var _express2 = _interopRequireDefault(_express);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = function (app) {
    var router = _express2.default.Router();

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
};