#!/bin/sh

# exit script if there are failures in any of the processes
set -e

cd client/

echo "******************************************"
echo "++ Installing frontend npm dependencies ++"
echo "******************************************"

npm install

cd ../server/

echo "******************************************"
echo "++ Installing backend npm dependencies ++ "
echo "******************************************"

npm install

cd db/

./run_migrations.sh

echo "******************************************"
echo "+++++ Running database migrations +++++++ "
echo "******************************************"

cd ../../rspec

echo "******************************************"
echo "++ Installing ruby testing dependencies ++"
echo "******************************************"

bundle install

cd ../client/

echo "******************************************"
echo "++++++ Running frontend unit tests +++++++"
echo "******************************************"

ng test --single-run=true

echo "******************************************"
echo "++++++ Frontend tests have passed! +++++++"
echo "******************************************"

cd ../rspec/

echo "******************************************"
echo "+++++++++ Running feature tests ++++++++++"
echo "******************************************"

rspec spec/features/

echo "******************************************"
echo "++++++ Feature tests have passed! ++++++++"
echo "******************************************"

echo "******************************************"
echo "+++++++++++ Running API tests ++++++++++++"
echo "******************************************"

rspec spec/api/

echo "******************************************"
echo "++++++++ Api tests have passed! ++++++++++"
echo "******************************************"

echo "******************************************"
echo "+++++++ ALL TESTS PASSED!!!!!!!!! ++++++++"
echo "******************************************"