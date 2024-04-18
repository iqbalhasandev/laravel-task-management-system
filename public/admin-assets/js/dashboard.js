am5.ready(function () {
    // Create root element
    var purchasechart = document.getElementById("purchasechart").dataset;
    var barChatValues = JSON.parse(purchasechart.values) ?? {};
    var totaldays = purchasechart.totaldays ?? 0;
    var title = purchasechart.title ?? "";

    var root = am5.Root.new("purchasechart");

    // Set themes
    root.setThemes([am5themes_Animated.new(root)]);

    // Create chart
    var chart = root.container.children.push(
        am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
        })
    );

    // Add cursor
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);

    // Create axes
    var xRenderer = am5xy.AxisRendererX.new(root, {
        minGridDistance: totaldays,
    });
    xRenderer.labels.template.setAll({
        centerY: am5.p50,
        centerX: am5.p100,
        paddingRight: 15,
    });

    xRenderer.grid.template.setAll({
        location: 1,
    });

    var xAxis = chart.xAxes.push(
        am5xy.CategoryAxis.new(root, {
            maxDeviation: 0.3,
            categoryField: "date",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {}),
        })
    );

    var yAxis = chart.yAxes.push(
        am5xy.ValueAxis.new(root, {
            maxDeviation: 0.3,
            renderer: am5xy.AxisRendererY.new(root, {
                strokeOpacity: 0.1,
            }),
        })
    );

    // Create series
    var series = chart.series.push(
        am5xy.ColumnSeries.new(root, {
            name: title,
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            sequencedInterpolation: true,
            categoryXField: "date",
            tooltip: am5.Tooltip.new(root, {
                // labelText: "{categoryX}: {valueY} ({text})",
                labelText: "{valueY}",
            }),
        })
    );

    series.columns.template.set(
        "fillGradient",
        am5.LinearGradient.new(root, {
            stops: [
                {
                    color: am5.color(0x16994a),
                },
                {
                    color: am5.color(0x0d873e),
                },
            ],
            rotation: 90,
        })
    );

    series.columns.template.setAll({
        cornerRadiusTL: 5,
        cornerRadiusTR: 5,
        shadowColor: am5.color(0x3f4040),
        shadowBlur: 4,
        shadowOffsetX: 4,
        shadowOffsetY: 4,
        shadowOpacity: 0.1,
    });

    series.columns.template.setAll({
        cornerRadiusTL: 5,
        cornerRadiusTR: 5,
        strokeOpacity: 0,
    });
    series.columns.template.adapters.add("fill", function (fill, target) {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });

    series.columns.template.adapters.add("stroke", function (stroke, target) {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });

    // Set data
    var cData = [
        {
            date: "01",
            value: 13,
            name: "this",
        },
        {
            date: "02",
            name: "this",
            value: 10,
        },
        {
            date: "03",
            name: "this",
            value: 9,
        },
    ];

    xAxis.data.setAll(barChatValues);
    series.data.setAll(barChatValues);

    // Make stuff animate on load
    series.appear(1000);
    chart.appear(1000, 100);
});

am5.ready(function () {
    // Create root element
    var cashierchart = document.getElementById("cashierchart").dataset;
    var piChartValues = JSON.parse(cashierchart.values) ?? {};

    var root = am5.Root.new("cashierchart");

    // Set themes
    root.setThemes([am5themes_Animated.new(root)]);

    // Create chart
    var chart = root.container.children.push(
        am5percent.PieChart.new(root, {
            layout: root.verticalLayout,
        })
    );

    // Create series
    var series = chart.series.push(
        am5percent.PieSeries.new(root, {
            valueField: "value",
            categoryField: "type",
        })
    );

    series
        .get("colors")
        .set("colors", [
            am5.color(0x16994a),
            am5.color(0x385c6b),
            am5.color(0xeeeeee),
        ]);

    // Disabling labels and ticks
    series.labels.template.set("visible", false);
    series.ticks.template.set("visible", false);

    // Set data
    series.data.setAll(piChartValues);

    // Create legend
    var legend = chart.children.push(
        am5.Legend.new(root, {
            centerX: am5.percent(50),
            x: am5.percent(50),
            marginTop: 15,
            marginBottom: 15,
        })
    );

    legend.data.setAll(series.dataItems);

    // Play initial series animation
    series.appear(1000, 100);
});
