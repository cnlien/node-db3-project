const knex = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return knex('schemes')
}

function findById(id) {
    return knex('schemes').where({ id })
}

function findSteps(id) {
    return (
        knex('steps')
            .join('schemes', 'schemes.id', 'steps.scheme_id')
            .select('steps.step_number', 'steps.id', 'schemes.scheme_name', 'steps.instructions')
            .where({scheme_id: id})
            .orderBy('steps.step_number')
    )
}

function add(schemeData) {
    return knex('schemes')
        .insert(schemeData, 'id')
}

function update(changes, id) {
    return (
        knex('schemes')
            .where({ id })
            .update(changes)
    )
}

function remove(id) {
    return(
        knex('schemes')
            .where({ id })
            .del()
    )
}
