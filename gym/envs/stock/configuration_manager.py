import os

# TODO: hardcoded for now -tony
_DEFAULT_OUTPUT_PATH = (
    "/Users/tony.lee/Desktop/IK/ML/stanford/cs221/code/rl_project/stocks"
)

"""
Read-only configuration manager for stock trading. Environment variables are read once on
initialization.
"""
class StockConfigManager:
    def __init__(self):
        self._stock_home = os.environ.get("STOCK_HOME", _DEFAULT_OUTPUT_PATH)
        self._should_output_charts = os.environ.get("OUTPUT_CHART", "False") == "True"

        self._rl_alg = os.environ.get("RL_ALGORITHM", "none")
        self._start_money = int(os.environ.get("START_MONEY", "10000"))  # in dollars

        # Training period
        self._train_start = int(os.environ.get("TRAIN_START", "20090000"))
        self._train_end = int(os.environ.get("TRAIN_END", "20190000"))
        self._validate_period(self._train_start, self._train_end)

        # Test period
        self._test_start = int(os.environ.get("TEST_START", "20190101"))
        self._test_end = int(os.environ.get("TEST_END", "20191001"))
        self._validate_period(self._test_start, self._test_end)

    def _validate_period(self, start, end):
        if start >= end:
            raise RuntimeError("Invalid period: {} - {}".format(start, end))

    def get_stock_home(self):
        return self._stock_home

    def should_output_charts(self):
        return self._should_output_charts

    def get_start_money(self):
        return self._start_money

    def get_train_start(self):
        return self._train_start

    def get_train_end(self):
        return self._train_end

    def within_training_period(self, date):
        return self._train_start < date < self._train_end

    def get_test_start(self):
        return self._test_start

    def get_test_end(self):
        return self._test_end

    def within_testing_period(self, date):
        return self._test_start < date < self._test_end

    def get_run_id(self):
        return "{}_money_{}_train_{}-{}_test_{}-{}".format(
            self._rl_alg,
            self._start_money,
            self._train_start,
            self._train_end,
            self._test_start,
            self._test_end,
        )
