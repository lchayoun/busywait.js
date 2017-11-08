test:
	echo TRAVIS_JOB_ID $(TRAVIS_JOB_ID)
	./node_modules/.bin/jshint ./test ./lib/index.js
	@NODE_ENV=test ./node_modules/.bin/mocha -b --reporter spec
	@NODE_ENV=test ./node_modules/.bin/istanbul cover \
	./node_modules/mocha/bin/_mocha --report lcovonly -- -R spec && \
		cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js || true
	./node_modules/.bin/bithound check git@github.com:regevbr/busywait.js.git
		
.PHONY: test
