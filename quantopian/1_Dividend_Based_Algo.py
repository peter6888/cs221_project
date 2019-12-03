"""
This is a template algorithm on Quantopian for you to adapt and fill in.
"""
import quantopian.algorithm as algo
from quantopian.pipeline import Pipeline
from quantopian.pipeline.data.builtin import USEquityPricing
from quantopian.pipeline.filters import QTradableStocksUS
from quantopian.pipeline.factors import SimpleMovingAverage
from quantopian.pipeline.data.morningstar import Fundamentals, share_class_reference
import quantopian.optimize as opt
from quantopian.pipeline.data.psychsignal import stocktwits

def initialize(context):
    """
    Called once at the start of the algorithm.
    """
    # Rebalance every day, 1 hour after market open.
    algo.schedule_function(
        rebalance,
        algo.date_rules.every_day(),
        algo.time_rules.market_open(hours=1),
    )

    # Record tracking variables at the end of each day.
    algo.schedule_function(
        record_vars,
        algo.date_rules.every_day(),
        algo.time_rules.market_close(),
    )

    # Create our dynamic stock selector.
    algo.attach_pipeline(make_pipeline(), 'pipeline')
    
    # Contraint parameters
    context.max_leverage = 1.0
    context.max_pos_size = 0.015
    context.max_turnover = 0.95

def make_pipeline():
    """
    A function to create our dynamic stock selector (pipeline). Documentation
    on pipeline can be found here:
    https://www.quantopian.com/help#pipeline-title
    """

    # Base universe set to the QTradableStocksUS
    base_universe = QTradableStocksUS()

    # Factor of yesterday's close price.
    yesterday_close = USEquityPricing.close.latest
    
    # Filters
    has_not_bad_forward_div_yield =  Fundamentals.forward_dividend_yield.latest> 0.05
    has_not_bad_trailing_dividend_yield = Fundamentals.trailing_dividend_yield.latest > 0.045
    price_gt_5_dollar = yesterday_close > 5.0
    not_risky_div_yield = Fundamentals.trailing_dividend_yield.latest < 0.28
    
    # add sentiment score (just like the Institude Scores
    sentiment_score = SimpleMovingAverage(
        inputs=[stocktwits.bull_minus_bear],
        window_length=3,
    )
    
    # Filters on sentiment_score
    good_sentiment_score = sentiment_score > -0.5
    
    pipe = Pipeline(
        columns={
            'close': yesterday_close,
            'forward_dividened_yield':Fundamentals.forward_dividend_yield.latest,
            'sentiment_score': sentiment_score
        },
        screen=base_universe
        & has_not_bad_forward_div_yield 
        & has_not_bad_trailing_dividend_yield & price_gt_5_dollar & good_sentiment_score
    )
    return pipe


def before_trading_start(context, data):
    """
    Called every day before market open.
    """
    context.output = algo.pipeline_output('pipeline')

    # These are the securities that we are interested in trading each day.
    context.security_list = context.output.index


def rebalance(context, data):
    """
    Execute orders according to our schedule_function() timing.
    """
    #log.info(context.output.head(10))
    log.info(context.security_list)
    
    # use forward dividened yield as alpha
    alpha = context.output.forward_dividened_yield
    
    # below are referencing Turtorial 
    if not alpha.empty:
        objective = opt.MaximizeAlpha(alpha)
        constrain_pos_size = opt.PositionConcentration.with_equal_bounds(0.0, context.max_pos_size)
        max_leverage = opt.MaxGrossExposure(context.max_leverage)
        dollar_neutral = opt.DollarNeutral()
        max_turnover = opt.MaxTurnover(context.max_turnover)
        algo.order_optimal_portfolio(objective=objective, 
            constraints=[
                constrain_pos_size,
                max_turnover
            ]
        )

def record_vars(context, data):
    """
    Plot variables at the end of each day.
    """
    pass


def handle_data(context, data):
    """
    Called every minute.
    """
    pass