# DCC profiles

## install all gems

```bash
bundle install --path .vendor/ --without system_tests development; bundle update; bundle clean
```

## list all tasks

```bash
bundle exec rake -T
```

## run tests

```bash
bundle exec rake test
```
