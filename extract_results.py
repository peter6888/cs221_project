import argparse
import json
import numpy as np
import os

from collections import OrderedDict

_OUTPUT_FILE_NAME = "final_result.json"


def main():
    print("Extracting results...")
    final_result = dict()
    baseline_result = dict()
    for f in os.listdir(root):
        if f == "final_assets.txt" or f == _OUTPUT_FILE_NAME:
            continue
        runs_path = "{}/{}".format(root, f)
        if "dji" in f:
            file = open(runs_path, "r")
            dji = file.read().split(',')
            try:
                baseline_result[f] = (dji[-1], _annual_return(dji[-1].split("\"")[0]))
            except ValueError:
                continue
            continue
        for r in os.listdir(runs_path):
            if "final_assets" in r:
                run_path = "{}/{}".format(runs_path, r)
                runs_result = _extract_result(run_path)
                final_result[f] = _analyze(runs_result)
    # sort runs_result by keys
    final_result = OrderedDict(sorted(final_result.items()))
    output_path = "{}/{}".format(root, _OUTPUT_FILE_NAME)
    print("Writing out aggregated results to path: " + output_path)
    with open(output_path, "w") as json_file:
        json.dump(final_result, json_file, indent=4, sort_keys=True)

    baseline_result = OrderedDict(sorted(baseline_result.items()))
    output_path = "{}/{}".format(root, "final_dji.json")
    with open(output_path, "w") as json_file:
        json.dump(baseline_result, json_file, indent=4, sort_keys=True)
    print("Done.")


def _extract_result(file_path):
    lines = open(file_path).read().splitlines()
    return np.array(lines).astype(np.float)


def _analyze(runs_result):
    return {
        "mean": np.mean(runs_result),
        "mean_percent_return": _annual_return(np.mean(runs_result)),
        "median": np.median(runs_result),
        "min": np.min(runs_result),
        "max": np.max(runs_result),
        "variance": np.var(runs_result),
        "std_dev": np.std(runs_result),
    }

def _annual_return(portfolio_val):
    # hardcoded for now -tony
    return ((float(portfolio_val) - 10000) / 10000) * 100

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Runs the result extractor on specified path.)"
    )
    parser.add_argument("folder", type=str, help="Path to results")

    args = parser.parse_args()
    root = args.folder
    main()
