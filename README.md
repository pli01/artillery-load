# artillery-load
Functional and load testing with artillery

## Build
```
docker-compose -f docker-compose-artillery.yml build
```
## Run
* Define scenario file in ./scenario
* Define data file in ./data
* reports wil be generate in ./reports

```
docker-compose -f docker-compose-artillery.yml run --rm artillery run -o reports/output.json -e dev -t "https://api.dev" scenario/scenario.yml
docker-compose -f docker-compose-artillery.yml run --rm artillery report reports/output.json
```
## Auto Run
* Use make to build, run-load, generate-report
```
make build
make run-load TARGET="http://api.tdl"
make generate-report
```
