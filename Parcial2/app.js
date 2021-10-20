
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
//const router = express.Router();
const path = require('path');
const estado= require('./models/estado');


//Middleware
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: false}));

//HTML Dinamico Middleware
app.get('/zombies', (request, response, next) => {
    estado.fetchAll()
    .then((result,field)=>{
        console.log(result[0])

        response.render('../views/estados', {
            estados: result[0]
        })
    })
    
});

app.get('/registrar', (request, response, next) => {
    
     estado.fetchAllEstados().then(([estados,_])=>{
    
            response.render('../views/registrar_zombie', {
                estados:estados
            })
        
     })

      ///  

    
});
//
app.post('/zombies', (request, response, next) => {
    let newZombie = new estado(request.body.nombre,request.body.id_estado)
    newZombie.save().then( () => {
    estado.fetchAll()
    .then((result,field)=>{
        response.render('../views/estados', {
            estados: result[0]
        })
    })
    })
});
app.use((request, response, next) => {
    console.log('Primer Middleware!');
    console.log(request.body);
    next(); //Le permite a la petición avanzar hacia el siguiente middleware
});

app.use('/ruta/nombres', (request, response, next) => {
    console.log('Tercer middleware!');
    response.send('Respuesta de la ruta "/ruta/nombres"'); 
});

app.use('/ruta/apellidos', (request, response, next) => {
    console.log('Tercer middleware!');
    response.send('Respuesta de la ruta "/ruta/apellidos"'); 
});

app.use('/ruta', (request, response, next) => {
    console.log('Segundo middleware!');
    response.send('Respuesta de la ruta "/ruta"'); 
});


app.use((request, response, next) => {
    console.log('Tercer middleware!');
    response.status(404).send('NOT FOUND: ERROR 404'); //Manda la respuesta
});



app.listen(3000);