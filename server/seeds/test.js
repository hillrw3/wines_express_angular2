
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('wines').del()
    .then(function () {
      return Promise.all([
        knex('wines').insert({varietal: 'Chardonnay'}),
        knex('wines').insert({varietal: 'Gamay'}),
        knex('wines').insert({varietal: 'Viognier'})
      ]);
    });
};
