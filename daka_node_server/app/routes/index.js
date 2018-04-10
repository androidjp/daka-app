import express from 'express';

export default (app) => {
    const router = express.Router();

    let records = [
        {
            id:'1',
            title:'title1',
            type:0,
            duringTime:'1h'
        },
        {
            id:'2',
            title:'title2',
            type:1,
            duringTime:'1h'
        },
        {
            id:'3',
            title:'title3',
            type:2,
            duringTime:'1h'
        }
    ];

    router.route('/GET/recordList')
        .get((req, res, next) => {
            res.json(records);      
        });

    app.use('/api', router);
}