import matplotlib.pyplot as plt
from os import environ, mkdir
from os.path import isdir
from datetime import datetime
from gym.envs.stock.base_env import BaseEnv

stock_home = environ["STOCK_HOME"]
STOCK_CNT = 27
UNLIMITED_BUY_SELL = False

class StockTestEnv(BaseEnv):
    def __init__(self):
        super().__init__(0, 10000)

    def get_data(self):
        data = self.stock_data.get_test_daily_data()
        environ['PLAY_RUN'] = str(len(data) + 10)
        return data

    def reached_terminal(self, day):
        # when we have reached the end of the test period
        return day >= len(self.get_data()) - 1

    def _buy_sell_stock(self, actions):
        '''
        A general buy and sell stock. This approach doesn't limit the money or holding shares.
        :param actions: STOCK_CNT x [-5..0..5]
        '''
        if UNLIMITED_BUY_SELL:
            for index in range(len(actions)):
                action = actions[index]
                self.buy_sell_memory.append((self.data.date[index], self.data.tic[index], self.data.adjcp[index], action))
                self.state[0] -= self.state[index+1] * action
                self.state[index+STOCK_CNT+1] += action
                self.confirmed_buy_sell_memory.append((self.data.date[index], self.data.tic[index], self.data.adjcp[index],action))
        else:
            super()._buy_sell_stock(actions)

    def save_results(self, timestamp):
        timestamp = datetime.now().strftime("%Y%m%d%H%M%s")
        results_dir = '{}/results'.format(stock_home)
        if not isdir(results_dir):
            mkdir(results_dir)
        output_dir = results_dir + '/' + self.config_manager.get_run_id()
        if not isdir(output_dir):
            mkdir(output_dir)

        with open("{}/{}.txt".format(output_dir, timestamp), "w") as f:
            f.write(",".join([str(asset) for asset in self.asset_memory]))
        with open("{}/final_assets_{}.txt".format(output_dir, self.config_manager.get_run_id()), "a+") as f:
            f.write("{}\n".format(self.asset_memory[-1]))
        with open("{}/final_assets.txt".format(results_dir), "a+") as f:
            f.write("{} => {}\n".format(self.config_manager.get_run_id(), self.asset_memory[-1]))

        self._save_buysell(self.buy_sell_memory, "buysell", timestamp, output_dir)
        self._save_buysell(self.confirmed_buy_sell_memory, "confirmed", timestamp, output_dir)
        dji_account_growth = self.stock_data.get_baseline_dji_growth()
        if self.config_manager.should_output_charts():
            plt.plot(self.asset_memory, "r")
            plt.plot(dji_account_growth)
            plt.savefig("{}/test_{}.png".format(output_dir, timestamp))
            plt.close()

    def _save_buysell(self, transaction, file_ext, timestamp, output_path):
        with open(
            "{}/{}.txt.{}".format(output_path, timestamp, file_ext), "w"
        ) as f:
            f.write(
                "\n".join(
                    [
                        ",".join([str(date), tic, str(adjcp), str(share)])
                        for (date, tic, adjcp, share) in transaction
                    ]
                )
            )
