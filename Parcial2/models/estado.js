
const db = require('../database');




class estado{
    constructor (nombre, id_tipo_zombie){
        this.nombre = nombre
        this.id_tipo_zombie=id_tipo_zombie;
    }
    static fetchAll() {
        return db.execute('SELECT id ,nombre_completo, tipo_zombie, fecha_registro from estado_zombie INNER JOIN zombie ON zombie.id_zombie =estado_zombie.id_zombie INNER JOIN estado  ON estado_zombie.id_estado = estado.id_estado   ORDER by fecha_registro DESC');
    }

    static fetchAllZombies() {
        return db.execute('SELECT * FROM zombie')
    }
    static fetchAllEstados() {
        return db.execute('SELECT * FROM estado')
    }
    save() {
        return db.execute('INSERT INTO zombie (nombre_completo) VALUES (?)', [this.nombre]).then(()=>{
            return db.execute('INSERT INTO estado_zombie (id_zombie, id_estado, fecha_registro) VALUES (last_insert_id(), ?, current_timestamp())',
                [this.id_tipo_zombie]
            );
        })
    
    }
}
module.exports=estado;

