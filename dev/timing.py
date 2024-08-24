from pathways import Pathways

p = Pathways(
    datapackage="remind-SSP2-PkBudg1150-stem-SPS1.zip",
    geography_mapping="geo_mapping_remind_one_location.yaml",
    activities_mapping="act_categories_agg_one_category.yaml",
)

vars = [v for v in p.scenarios.coords["variables"].values if v.startswith("FE")]

p.calculate(
    methods=[m for m in p.lcia_methods if "RELICS" in m and "lithium" in m.lower()],
    regions=["CH"],
    scenarios=p.scenarios.pathway.values.tolist(),
    years=[
        # 2020,
        # 2030,
        # 2040,
        2050
    ],
    variables=vars,
    use_distributions=5,
    subshares=True,
    multiprocessing=False
)

p.export_results()
