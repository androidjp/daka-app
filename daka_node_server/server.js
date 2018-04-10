import express from 'express';
import bodyParser from 'body-parser';
const app = express();
var router = express.Router();

//---------------------------------------------------------

app.all('*', (req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

//---------------------------------------------------------
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

//---------------------------------------------------------

app.use(function(req, res, next){
    const err = new Error('Not Found');
    err.status = 404;
    next(err);
});

app.use(function(err, req, res, next){
    var json = {};
    json.message = err.message;
    json.status = (err.status) ? err.status : 500;
    // render the error page
    res.status(err.status || 500);
    res.json(json);
});

//---------------------------------------------------------


app.listen(8666, () => {
    console.log('App listening on port 8666!');
});

