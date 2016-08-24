namespace :db do
  desc "Import invoices"
  task invoices: [:environment] do
    Invoice.create!(
      name: "invoice1",
      latitude_start: 21.0093557, longitude_start: 105.8554427,
      latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "init", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice2",
      latitude_start: 21.0072829, longitude_start: 105.8413891,
      latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "waiting", user_id: 10,weight: 2.5, delivery_time: "25m",
      distance: 20, price: 250000, shipping_price: 25000)
    Invoice.create!(
      name: "invoice3",
      latitude_start: 21.0061393, longitude_start: 105.8419748,
      latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "shipping", user_id: 10,weight: 3, delivery_time: "10m",
      distance: 10, price: 300000, shipping_price: 30000)
    Invoice.create!(
      name: "invoice4",
      latitude_start: 21.0144139, longitude_start: 105.8031754,
      latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "shipped", user_id: 10,weight: 3, delivery_time: "15m",
      distance: 18, price: 400000, shipping_price: 40000)
    Invoice.create!(
      name: "invoice5",
      latitude_start: 21.0092948, longitude_start: 105.8099247,
      latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "finished", user_id: 10,weight: 3, delivery_time: "22m",
      distance: 19, price: 230000, shipping_price: 23000)
    Invoice.create!(
      name: "invoice6",
      latitude_start: 21.0066625, longitude_start: 105.8157497,
      latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "cancel", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice7",
      latitude_start: 21.0089672, longitude_start: 105.8564231,
      latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "init", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice8",
      latitude_start: 21.0091775, longitude_start: 105.8614859,
      latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "waiting", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice9",
      latitude_start: 21.0095855, longitude_start: 105.8538305,
      latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "shipping", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice10",
      latitude_start: 21.011365, longitude_start: 105.852981,
      latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "shipped", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice11",
      latitude_start: 21.0109244, longitude_start: 105.8493809,
      latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "finished", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice12",
      latitude_start: 21.0123202, longitude_start: 105.859587,
      latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "cancel", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice13",
      latitude_start: 21.0129412, longitude_start: 105.8544372,
      latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "init", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice14",
      latitude_start: 21.0166168, longitude_start: 105.8586751,
      latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "waiting", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice15",
      latitude_start: 21.0047933, longitude_start: 105.8585421,
      latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "shipping", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice16",
      latitude_start: 21.0053847, longitude_start: 105.8596241,
      latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "shipped", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice17",
      latitude_start: 21.0059004, longitude_start: 105.8645596,
      latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "finished", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice18",
      latitude_start: 21.0193116, longitude_start: 105.8572014,
      latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "cancel", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice19",
      latitude_start: 21.0212025, longitude_start: 105.8505825,
      latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "init", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice20",
      latitude_start: 21.0065532, longitude_start: 105.8438629,
      latitude_finish: 21.010269, longitude_finish: 105.8459939,
      status: "waiting", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice21",
      latitude_start: 21.0134527, longitude_start: 105.8467134,
      latitude_finish: 21.0141938, longitude_finish: 105.8537301,
      status: "shipping", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice22",
      latitude_start: 21.0152354, longitude_start: 105.8617874,
      latitude_finish: 21.0252924, longitude_finish: 105.8566079,
      status: "shipped", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice23",
      latitude_start: 21.0321767, longitude_start: 105.8461786,
      latitude_finish: 21.0330936, longitude_finish: 105.8551921,
      status: "finished", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice24",
      latitude_start: 21.0249921, longitude_start: 105.8486046,
      latitude_finish: 21.0191158, longitude_finish: 105.8473777,
      status: "cancel", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice25",
      latitude_start: 21.0157333, longitude_start: 105.8576068,
      latitude_finish: 21.0151729, longitude_finish: 105.8539703,
      status: "init", user_id: 7,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice26",
      latitude_start: 21.0180744, longitude_start: 105.850266,
      latitude_finish: 21.0183088, longitude_finish: 105.8586031,
      status: "waiting", user_id: 8,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice27",
      latitude_start: 21.0319187, longitude_start: 105.8552974,
      latitude_finish: 21.0181074, longitude_finish: 105.8557244,
      status: "shipping", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice28",
      latitude_start: 21.0054614, longitude_start: 105.8658601,
      latitude_finish: 21.0077049, longitude_finish: 105.8605386,
      status: "shipped", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice29",
      latitude_start: 21.0033221, longitude_start: 105.8592025,
      latitude_finish: 21.0071298, longitude_finish: 105.8693318,
      status: "finished", user_id: 6,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice30",
      latitude_start: 21.0131, longitude_start: 105.8619079,
      latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "cancel", user_id: 10,weight: 3, delivery_time: "17m",
      distance: 18, price: 220000, shipping_price: 22000)
    Invoice.create!(
      name: "invoice31",
      latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "init", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice32",
      latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "waiting", user_id: 7,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice33",
      latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "shipping", user_id: 8,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice34",
      latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "shipped", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice35",
      latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "finished", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice36",
      latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "cancel", user_id: 7,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice37",
      latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "init", user_id: 8,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice38",
      latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "waiting", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice39",
      latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "shipping", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice40",
      latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "shipped", user_id: 7,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice41",
      latitude_start: 21.00809099740665, longitude_start: 105.8351485501098,
      latitude_finish: 21.00332345361407, longitude_finish: 105.84785149200434,
      status: "finished", user_id: 8,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice42",
      latitude_start: 21.001320238508796, longitude_start: 105.83549187286371,
      latitude_finish: 21.009012437884255, longitude_finish: 105.8342473278808,
      status: "cancel", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice43",
      latitude_start: 21.005807403000656, longitude_start: 105.81536457641596,
      latitude_finish: 21.011215859427857, longitude_finish: 105.81858322723383,
      status: "init", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice44",
      latitude_start: 21.010294432559697, longitude_start: 105.83386108978266,
      latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "waiting", user_id: 7,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice45",
      latitude_start: 21.016744301107924, longitude_start: 105.8324448834228,
      latitude_finish: 21.02553730602834, longitude_finish: 105.82656548126215,
      status: "shipping", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice46",
      latitude_start: 21.025737596226822, longitude_start: 105.82053587539667,
      latitude_finish: 21.030203997731203, longitude_finish: 105.83594248397822,
      status: "shipped", user_id: 8,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice47",
      latitude_start: 21.03158595135035, longitude_start: 105.82632944686884,
      latitude_finish: 21.033748983459823, longitude_finish: 105.815192915039,
      status: "finished", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice48",
      latitude_start: 21.035911984168646, longitude_start: 105.80360577209467,
      latitude_finish: 21.038235172173422, longitude_finish: 105.81660912139887,
      status: "cancel", user_id: 6,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice49",
      latitude_start: 21.04222055685705, longitude_start: 105.80549404724115,
      latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "init", user_id: 7,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
    Invoice.create!(
      name: "invoice50",
      latitude_start: 21.04534470344829, longitude_start: 105.80676004989618,
      latitude_finish: 21.0399174581113, longitude_finish: 105.79004452331537,
      status: "waiting", user_id: 10,weight: 3, delivery_time: "30m",
      distance: 25, price: 200000, shipping_price: 20000)
  end
end
