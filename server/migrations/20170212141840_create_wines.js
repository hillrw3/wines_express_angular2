exports.up = function (knex, Promise) {
  return knex.schema.createTable('wines', function (table) {
    table.increments();
    table.string('varietal');
    table.timestamps();
  })
};

exports.down = function (knex, Promise) {
  return knex.schema.dropTable('wines')
};
