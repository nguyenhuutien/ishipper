namespace :db do
  desc "Import invoices"
  task invoices: [:environment] do
    Invoice.create!(
      name: "invoice1",
      address_start: "start 1", latitude_start: 21.0093557, longitude_start: 105.8554427,
      address_finish: "finish 1", latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "init", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice2",
      address_start: "start 2", latitude_start: 21.0072829, longitude_start: 105.8413891,
      address_finish: "finish 2", latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "init", user_id: 1,weight: 2.5, delivery_time: "25m",
      distance_invoice: 20, price: 250000, shipping_price: 25000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice3",
      address_start: "start 3", latitude_start: 21.0061393, longitude_start: 105.8419748,
      address_finish: "finish 3", latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "init", user_id: 1,weight: 3, delivery_time: "10m",
      distance_invoice: 10, price: 300000, shipping_price: 30000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice4",
      address_start: "start 4", latitude_start: 21.0144139, longitude_start: 105.8031754,
      address_finish: "finish 4", latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "init", user_id: 1,weight: 3, delivery_time: "15m",
      distance_invoice: 18, price: 400000, shipping_price: 40000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice5",
      address_start: "start 5", latitude_start: 21.0092948, longitude_start: 105.8099247,
      address_finish: "finish 5", latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "init", user_id: 1,weight: 3, delivery_time: "22m",
      distance_invoice: 19, price: 230000, shipping_price: 23000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice6",
      address_start: "start 6", latitude_start: 21.0066625, longitude_start: 105.8157497,
      address_finish: "finish 6", latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "init", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice7",
      address_start: "start 7", latitude_start: 21.0089672, longitude_start: 105.8564231,
      address_finish: "finish 7", latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "init", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice8",
      address_start: "start 8", latitude_start: 21.0091775, longitude_start: 105.8614859,
      address_finish: "finish 8", latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "init", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice9",
      address_start: "start 9", latitude_start: 21.0095855, longitude_start: 105.8538305,
      address_finish: "finish 9", latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "init", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice10",
      address_start: "start 10", latitude_start: 21.011365, longitude_start: 105.852981,
      address_finish: "finish 10", latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "init", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice11",
      address_start: "start 11", latitude_start: 21.0109244, longitude_start: 105.8493809,
      address_finish: "finish 11", latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice12",
      address_start: "start 12", latitude_start: 21.0123202, longitude_start: 105.859587,
      address_finish: "finish 12", latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice13",
      address_start: "start 13", latitude_start: 21.0129412, longitude_start: 105.8544372,
      address_finish: "finish 13", latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice14",
      address_start: "start 14", latitude_start: 21.0166168, longitude_start: 105.8586751,
      address_finish: "finish 14", latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice15",
      address_start: "start 15", latitude_start: 21.0047933, longitude_start: 105.8585421,
      address_finish: "finish 15", latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice16",
      address_start: "start 16", latitude_start: 21.0053847, longitude_start: 105.8596241,
      address_finish: "finish 16", latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice17",
      address_start: "start 17", latitude_start: 21.0059004, longitude_start: 105.8645596,
      address_finish: "finish 17", latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice18",
      address_start: "start 18", latitude_start: 21.0193116, longitude_start: 105.8572014,
      address_finish: "finish 18", latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice19",
      address_start: "start 19", latitude_start: 21.0212025, longitude_start: 105.8505825,
      address_finish: "finish 19", latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice20",
      address_start: "start 20", latitude_start: 21.0065532, longitude_start: 105.8438629,
      address_finish: "finish 20", latitude_finish: 21.010269, longitude_finish: 105.8459939,
      status: "init", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice21",
      address_start: "start 21", latitude_start: 21.0134527, longitude_start: 105.8467134,
      address_finish: "finish 21", latitude_finish: 21.0141938, longitude_finish: 105.8537301,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice22",
      address_start: "start 22", latitude_start: 21.0152354, longitude_start: 105.8617874,
      address_finish: "finish 22", latitude_finish: 21.0252924, longitude_finish: 105.8566079,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice23",
      address_start: "start 23", latitude_start: 21.0321767, longitude_start: 105.8461786,
      address_finish: "finish 23", latitude_finish: 21.0330936, longitude_finish: 105.8551921,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice24",
      address_start: "start 24", latitude_start: 21.0249921, longitude_start: 105.8486046,
      address_finish: "finish 24", latitude_finish: 21.0191158, longitude_finish: 105.8473777,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice25",
      address_start: "start 25", latitude_start: 21.0157333, longitude_start: 105.8576068,
      address_finish: "finish 25", latitude_finish: 21.0151729, longitude_finish: 105.8539703,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice26",
      address_start: "start 26", latitude_start: 21.0180744, longitude_start: 105.850266,
      address_finish: "finish 26", latitude_finish: 21.0183088, longitude_finish: 105.8586031,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice27",
      address_start: "start 27", latitude_start: 21.0319187, longitude_start: 105.8552974,
      address_finish: "finish 27", latitude_finish: 21.0181074, longitude_finish: 105.8557244,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice28",
      address_start: "start 28", latitude_start: 21.0054614, longitude_start: 105.8658601,
      address_finish: "finish 28", latitude_finish: 21.0077049, longitude_finish: 105.8605386,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice29",
      address_start: "start 29", latitude_start: 21.0033221, longitude_start: 105.8592025,
      address_finish: "finish 29", latitude_finish: 21.0071298, longitude_finish: 105.8693318,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice30",
      address_start: "start 30", latitude_start: 21.0131, longitude_start: 105.8619079,
      address_finish: "finish 30", latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "init", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice31",
      address_start: "start 31", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 31", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice32",
      address_start: "start 32", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 32", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice33",
      address_start: "start 33", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 33", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice34",
      address_start: "start 34", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 34", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice35",
      address_start: "start 35", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 35", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice36",
      address_start: "start 36", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 36", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice37",
      address_start: "start 37", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 37", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice38",
      address_start: "start 38", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 38", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice39",
      address_start: "start 39", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 39", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "waiting", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice40",
      address_start: "start 40", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 40", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice41",
      address_start: "start 41", latitude_start: 21.00809099740665, longitude_start: 105.8351485501098,
      address_finish: "finish 41", latitude_finish: 21.00332345361407, longitude_finish: 105.84785149200434,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice42",
      address_start: "start 42", latitude_start: 21.001320238508796, longitude_start: 105.83549187286371,
      address_finish: "finish 42", latitude_finish: 21.009012437884255, longitude_finish: 105.8342473278808,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice43",
      address_start: "start 43", latitude_start: 21.005807403000656, longitude_start: 105.81536457641596,
      address_finish: "finish 43", latitude_finish: 21.011215859427857, longitude_finish: 105.81858322723383,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice44",
      address_start: "start 44", latitude_start: 21.010294432559697, longitude_start: 105.83386108978266,
      address_finish: "finish 44", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice45",
      address_start: "start 45", latitude_start: 21.016744301107924, longitude_start: 105.8324448834228,
      address_finish: "finish 45", latitude_finish: 21.02553730602834, longitude_finish: 105.82656548126215,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice46",
      address_start: "start 46", latitude_start: 21.025737596226822, longitude_start: 105.82053587539667,
      address_finish: "finish 46", latitude_finish: 21.030203997731203, longitude_finish: 105.83594248397822,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice47",
      address_start: "start 47", latitude_start: 21.03158595135035, longitude_start: 105.82632944686884,
      address_finish: "finish 47", latitude_finish: 21.033748983459823, longitude_finish: 105.815192915039,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice48",
      address_start: "start 48", latitude_start: 21.035911984168646, longitude_start: 105.80360577209467,
      address_finish: "finish 48", latitude_finish: 21.038235172173422, longitude_finish: 105.81660912139887,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice49",
      address_start: "start 49", latitude_start: 21.04222055685705, longitude_start: 105.80549404724115,
      address_finish: "finish 49", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice50",
      address_start: "start 50", latitude_start: 21.04534470344829, longitude_start: 105.80676004989618,
      address_finish: "finish 50", latitude_finish: 21.0399174581113, longitude_finish: 105.79004452331537,
      status: "waiting", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice51",
      address_start: "start 51", latitude_start: 21.0093557, longitude_start: 105.8554427,
      address_finish: "finish 51", latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice52",
      address_start: "start 52", latitude_start: 21.0072829, longitude_start: 105.8413891,
      address_finish: "finish 52", latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "waiting", user_id: 3,weight: 2.5, delivery_time: "25m",
      distance_invoice: 20, price: 250000, shipping_price: 25000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice53",
      address_start: "start 53", latitude_start: 21.0061393, longitude_start: 105.8419748,
      address_finish: "finish 53", latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "10m",
      distance_invoice: 10, price: 300000, shipping_price: 30000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice54",
      address_start: "start 54", latitude_start: 21.0144139, longitude_start: 105.8031754,
      address_finish: "finish 54", latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "15m",
      distance_invoice: 18, price: 400000, shipping_price: 40000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice55",
      address_start: "start 55", latitude_start: 21.0092948, longitude_start: 105.8099247,
      address_finish: "finish 55", latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "22m",
      distance_invoice: 19, price: 230000, shipping_price: 23000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice56",
      address_start: "start 56", latitude_start: 21.0066625, longitude_start: 105.8157497,
      address_finish: "finish 56", latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice57",
      address_start: "start 57", latitude_start: 21.0089672, longitude_start: 105.8564231,
      address_finish: "finish 57", latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice58",
      address_start: "start 58", latitude_start: 21.0091775, longitude_start: 105.8614859,
      address_finish: "finish 58", latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice59",
      address_start: "start 59", latitude_start: 21.0095855, longitude_start: 105.8538305,
      address_finish: "finish 59", latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice60",
      address_start: "start 60", latitude_start: 21.011365, longitude_start: 105.852981,
      address_finish: "finish 60", latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "waiting", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice61",
      address_start: "start 61", latitude_start: 21.0109244, longitude_start: 105.8493809,
      address_finish: "finish 61", latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice62",
      address_start: "start 62", latitude_start: 21.0123202, longitude_start: 105.859587,
      address_finish: "finish 62", latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice63",
      address_start: "start 63", latitude_start: 21.0129412, longitude_start: 105.8544372,
      address_finish: "finish 63", latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice64",
      address_start: "start 64", latitude_start: 21.0166168, longitude_start: 105.8586751,
      address_finish: "finish 64", latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice65",
      address_start: "start 65", latitude_start: 21.0047933, longitude_start: 105.8585421,
      address_finish: "finish 65", latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice66",
      address_start: "start 66", latitude_start: 21.0053847, longitude_start: 105.8596241,
      address_finish: "finish 66", latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice67",
      address_start: "start 67", latitude_start: 21.0059004, longitude_start: 105.8645596,
      address_finish: "finish 67", latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice68",
      address_start: "start 68", latitude_start: 21.0193116, longitude_start: 105.8572014,
      address_finish: "finish 68", latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice69",
      address_start: "start 69", latitude_start: 21.0212025, longitude_start: 105.8505825,
      address_finish: "finish 69", latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice70",
      address_start: "start 70", latitude_start: 21.0065532, longitude_start: 105.8438629,
      address_finish: "finish 70", latitude_finish: 21.010269, longitude_finish: 105.8459939,
      status: "shipping", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice71",
      address_start: "start 71", latitude_start: 21.0134527, longitude_start: 105.8467134,
      address_finish: "finish 71", latitude_finish: 21.0141938, longitude_finish: 105.8537301,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice72",
      address_start: "start 72", latitude_start: 21.0152354, longitude_start: 105.8617874,
      address_finish: "finish 72", latitude_finish: 21.0252924, longitude_finish: 105.8566079,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice73",
      address_start: "start 73", latitude_start: 21.0321767, longitude_start: 105.8461786,
      address_finish: "finish 73", latitude_finish: 21.0330936, longitude_finish: 105.8551921,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice74",
      address_start: "start 74", latitude_start: 21.0249921, longitude_start: 105.8486046,
      address_finish: "finish 74", latitude_finish: 21.0191158, longitude_finish: 105.8473777,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice75",
      address_start: "start 75", latitude_start: 21.0157333, longitude_start: 105.8576068,
      address_finish: "finish 75", latitude_finish: 21.0151729, longitude_finish: 105.8539703,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice76",
      address_start: "start 76", latitude_start: 21.0180744, longitude_start: 105.850266,
      address_finish: "finish 76", latitude_finish: 21.0183088, longitude_finish: 105.8586031,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice77",
      address_start: "start 77", latitude_start: 21.0319187, longitude_start: 105.8552974,
      address_finish: "finish 77", latitude_finish: 21.0181074, longitude_finish: 105.8557244,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice78",
      address_start: "start 78", latitude_start: 21.0054614, longitude_start: 105.8658601,
      address_finish: "finish 78", latitude_finish: 21.0077049, longitude_finish: 105.8605386,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice79",
      address_start: "start 79", latitude_start: 21.0033221, longitude_start: 105.8592025,
      address_finish: "finish 79", latitude_finish: 21.0071298, longitude_finish: 105.8693318,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice80",
      address_start: "start 80", latitude_start: 21.0131, longitude_start: 105.8619079,
      address_finish: "finish 80", latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "shipping", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice81",
      address_start: "start 81", latitude_start: 21.0093557, longitude_start: 105.8554427,
      address_finish: "finish 81", latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice82",
      address_start: "start 82", latitude_start: 21.0072829, longitude_start: 105.8413891,
      address_finish: "finish 82", latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "shipping", user_id: 3,weight: 2.5, delivery_time: "25m",
      distance_invoice: 20, price: 250000, shipping_price: 25000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice83",
      address_start: "start 83", latitude_start: 21.0061393, longitude_start: 105.8419748,
      address_finish: "finish 83", latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "10m",
      distance_invoice: 10, price: 300000, shipping_price: 30000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice84",
      address_start: "start 84", latitude_start: 21.0144139, longitude_start: 105.8031754,
      address_finish: "finish 84", latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "15m",
      distance_invoice: 18, price: 400000, shipping_price: 40000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice85",
      address_start: "start 85", latitude_start: 21.0092948, longitude_start: 105.8099247,
      address_finish: "finish 85", latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "22m",
      distance_invoice: 19, price: 230000, shipping_price: 23000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice86",
      address_start: "start 86", latitude_start: 21.0066625, longitude_start: 105.8157497,
      address_finish: "finish 86", latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice87",
      address_start: "start 87", latitude_start: 21.0089672, longitude_start: 105.8564231,
      address_finish: "finish 87", latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice88",
      address_start: "start 88", latitude_start: 21.0091775, longitude_start: 105.8614859,
      address_finish: "finish 88", latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice89",
      address_start: "start 89", latitude_start: 21.0095855, longitude_start: 105.8538305,
      address_finish: "finish 89", latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice90",
      address_start: "start 90", latitude_start: 21.011365, longitude_start: 105.852981,
      address_finish: "finish 90", latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "shipping", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice91",
      address_start: "start 91", latitude_start: 21.0109244, longitude_start: 105.8493809,
      address_finish: "finish 91", latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice92",
      address_start: "start 92", latitude_start: 21.0123202, longitude_start: 105.859587,
      address_finish: "finish 92", latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice93",
      address_start: "start 93", latitude_start: 21.0129412, longitude_start: 105.8544372,
      address_finish: "finish 93", latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoic94",
      address_start: "start 94", latitude_start: 21.0166168, longitude_start: 105.8586751,
      address_finish: "finish 94", latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice95",
      address_start: "start 95", latitude_start: 21.0047933, longitude_start: 105.8585421,
      address_finish: "finish 95", latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice96",
      address_start: "start 96", latitude_start: 21.0053847, longitude_start: 105.8596241,
      address_finish: "finish 96", latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice97",
      address_start: "start 97", latitude_start: 21.0059004, longitude_start: 105.8645596,
      address_finish: "finish 97", latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice98",
      address_start: "start 98", latitude_start: 21.0193116, longitude_start: 105.8572014,
      address_finish: "finish 98", latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice99",
      address_start: "start 99", latitude_start: 21.0212025, longitude_start: 105.8505825,
      address_finish: "finish 99", latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice100",
      address_start: "start 130", latitude_start: 21.0131, longitude_start: 105.8619079,
      address_finish: "finish 130", latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "shipped", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice101",
      address_start: "start 11", latitude_start: 21.0093557, longitude_start: 105.8554427,
      address_finish: "finish 11", latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice102",
      address_start: "start 12", latitude_start: 21.0072829, longitude_start: 105.8413891,
      address_finish: "finish 12", latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "shipped", user_id: 2,weight: 2.5, delivery_time: "25m",
      distance_invoice: 20, price: 250000, shipping_price: 25000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice103",
      address_start: "start 13", latitude_start: 21.0061393, longitude_start: 105.8419748,
      address_finish: "finish 13", latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "10m",
      distance_invoice: 10, price: 300000, shipping_price: 30000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice104",
      address_start: "start 14", latitude_start: 21.0144139, longitude_start: 105.8031754,
      address_finish: "finish 14", latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "15m",
      distance_invoice: 18, price: 400000, shipping_price: 40000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice105",
      address_start: "start 15", latitude_start: 21.0092948, longitude_start: 105.8099247,
      address_finish: "finish 15", latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "22m",
      distance_invoice: 19, price: 230000, shipping_price: 23000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice106",
      address_start: "start 16", latitude_start: 21.0066625, longitude_start: 105.8157497,
      address_finish: "finish 16", latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice107",
      address_start: "start 17", latitude_start: 21.0089672, longitude_start: 105.8564231,
      address_finish: "finish 17", latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice108",
      address_start: "start 18", latitude_start: 21.0091775, longitude_start: 105.8614859,
      address_finish: "finish 18", latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice109",
      address_start: "start 19", latitude_start: 21.0095855, longitude_start: 105.8538305,
      address_finish: "finish 19", latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice110",
      address_start: "start 110", latitude_start: 21.011365, longitude_start: 105.852981,
      address_finish: "finish 110", latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "shipped", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice111",
      address_start: "start 111", latitude_start: 21.0109244, longitude_start: 105.8493809,
      address_finish: "finish 111", latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice112",
      address_start: "start 112", latitude_start: 21.0123202, longitude_start: 105.859587,
      address_finish: "finish 112", latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice113",
      address_start: "start 113", latitude_start: 21.0129412, longitude_start: 105.8544372,
      address_finish: "finish 113", latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice114",
      address_start: "start 114", latitude_start: 21.0166168, longitude_start: 105.8586751,
      address_finish: "finish 114", latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice115",
      address_start: "start 115", latitude_start: 21.0047933, longitude_start: 105.8585421,
      address_finish: "finish 115", latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice116",
      address_start: "start 116", latitude_start: 21.0053847, longitude_start: 105.8596241,
      address_finish: "finish 116", latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice117",
      address_start: "start 117", latitude_start: 21.0059004, longitude_start: 105.8645596,
      address_finish: "finish 117", latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice118",
      address_start: "start 118", latitude_start: 21.0193116, longitude_start: 105.8572014,
      address_finish: "finish 118", latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice119",
      address_start: "start 119", latitude_start: 21.0212025, longitude_start: 105.8505825,
      address_finish: "finish 119", latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice120",
      address_start: "start 120", latitude_start: 21.0065532, longitude_start: 105.8438629,
      address_finish: "finish 120", latitude_finish: 21.010269, longitude_finish: 105.8459939,
      status: "shipped", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice121",
      address_start: "start 121", latitude_start: 21.0134527, longitude_start: 105.8467134,
      address_finish: "finish 121", latitude_finish: 21.0141938, longitude_finish: 105.8537301,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice122",
      address_start: "start 122", latitude_start: 21.0152354, longitude_start: 105.8617874,
      address_finish: "finish 122", latitude_finish: 21.0252924, longitude_finish: 105.8566079,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice123",
      address_start: "start 123", latitude_start: 21.0321767, longitude_start: 105.8461786,
      address_finish: "finish 123", latitude_finish: 21.0330936, longitude_finish: 105.8551921,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice124",
      address_start: "start 124", latitude_start: 21.0249921, longitude_start: 105.8486046,
      address_finish: "finish 124", latitude_finish: 21.0191158, longitude_finish: 105.8473777,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice125",
      address_start: "start 125", latitude_start: 21.0157333, longitude_start: 105.8576068,
      address_finish: "finish 125", latitude_finish: 21.0151729, longitude_finish: 105.8539703,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice126",
      address_start: "start 126", latitude_start: 21.0180744, longitude_start: 105.850266,
      address_finish: "finish 126", latitude_finish: 21.0183088, longitude_finish: 105.8586031,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice127",
      address_start: "start 127", latitude_start: 21.0319187, longitude_start: 105.8552974,
      address_finish: "finish 127", latitude_finish: 21.0181074, longitude_finish: 105.8557244,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice128",
      address_start: "start 128", latitude_start: 21.0054614, longitude_start: 105.8658601,
      address_finish: "finish 128", latitude_finish: 21.0077049, longitude_finish: 105.8605386,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice129",
      address_start: "start 129", latitude_start: 21.0033221, longitude_start: 105.8592025,
      address_finish: "finish 129", latitude_finish: 21.0071298, longitude_finish: 105.8693318,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice130",
      address_start: "start 130", latitude_start: 21.0131, longitude_start: 105.8619079,
      address_finish: "finish 130", latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "finished", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice131",
      address_start: "start 131", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 131", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice132",
      address_start: "start 132", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 132", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice133",
      address_start: "start 133", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 133", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice134",
      address_start: "start 134", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 134", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice135",
      address_start: "start 135", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 135", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice136",
      address_start: "start 136", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 136", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice137",
      address_start: "start 137", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 137", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice138",
      address_start: "start 138", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 138", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice139",
      address_start: "start 139", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 139", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice140",
      address_start: "start 140", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 140", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "finished", user_id: 2,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice141",
      address_start: "start 141", latitude_start: 21.00809099740665, longitude_start: 105.8351485501098,
      address_finish: "finish 141", latitude_finish: 21.00332345361407, longitude_finish: 105.84785149200434,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice142",
      address_start: "start 142", latitude_start: 21.001320238508796, longitude_start: 105.83549187286371,
      address_finish: "finish 142", latitude_finish: 21.009012437884255, longitude_finish: 105.8342473278808,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice143",
      address_start: "start 143", latitude_start: 21.005807403000656, longitude_start: 105.81536457641596,
      address_finish: "finish 143", latitude_finish: 21.011215859427857, longitude_finish: 105.81858322723383,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice144",
      address_start: "start 144", latitude_start: 21.010294432559697, longitude_start: 105.83386108978266,
      address_finish: "finish 144", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice145",
      address_start: "start 145", latitude_start: 21.016744301107924, longitude_start: 105.8324448834228,
      address_finish: "finish 145", latitude_finish: 21.02553730602834, longitude_finish: 105.82656548126215,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice146",
      address_start: "start 146", latitude_start: 21.025737596226822, longitude_start: 105.82053587539667,
      address_finish: "finish 146", latitude_finish: 21.030203997731203, longitude_finish: 105.83594248397822,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice147",
      address_start: "start 147", latitude_start: 21.03158595135035, longitude_start: 105.82632944686884,
      address_finish: "finish 147", latitude_finish: 21.033748983459823, longitude_finish: 105.815192915039,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice148",
      address_start: "start 148", latitude_start: 21.035911984168646, longitude_start: 105.80360577209467,
      address_finish: "finish 148", latitude_finish: 21.038235172173422, longitude_finish: 105.81660912139887,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice149",
      address_start: "start 149", latitude_start: 21.04222055685705, longitude_start: 105.80549404724115,
      address_finish: "finish 149", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice150",
      address_start: "start 150", latitude_start: 21.04534470344829, longitude_start: 105.80676004989618,
      address_finish: "finish 150", latitude_finish: 21.0399174581113, longitude_finish: 105.79004452331537,
      status: "finished", user_id: 3,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice151",
      address_start: "start 51", latitude_start: 21.0093557, longitude_start: 105.8554427,
      address_finish: "finish 51", latitude_finish: 21.0066625, longitude_finish: 105.8157497,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice152",
      address_start: "start 52", latitude_start: 21.0072829, longitude_start: 105.8413891,
      address_finish: "finish 52", latitude_finish: 21.0093557, longitude_finish: 105.8554427,
      status: "cancel", user_id: 1,weight: 2.5, delivery_time: "25m",
      distance_invoice: 20, price: 250000, shipping_price: 25000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice153",
      address_start: "start 53", latitude_start: 21.0061393, longitude_start: 105.8419748,
      address_finish: "finish 53", latitude_finish: 21.0072829, longitude_finish: 105.8413891,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "10m",
      distance_invoice: 10, price: 300000, shipping_price: 30000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice154",
      address_start: "start 54", latitude_start: 21.0144139, longitude_start: 105.8031754,
      address_finish: "finish 54", latitude_finish: 21.0061393, longitude_finish: 105.8419748,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "15m",
      distance_invoice: 18, price: 400000, shipping_price: 40000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice155",
      address_start: "start 55", latitude_start: 21.0092948, longitude_start: 105.8099247,
      address_finish: "finish 55", latitude_finish: 21.0144139, longitude_finish: 105.8031754,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "22m",
      distance_invoice: 19, price: 230000, shipping_price: 23000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice156",
      address_start: "start 56", latitude_start: 21.0066625, longitude_start: 105.8157497,
      address_finish: "finish 56", latitude_finish: 21.0092948, longitude_finish: 105.8099247,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice157",
      address_start: "start 57", latitude_start: 21.0089672, longitude_start: 105.8564231,
      address_finish: "finish 57", latitude_finish: 21.0089171, longitude_finish: 105.8538589,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice158",
      address_start: "start 58", latitude_start: 21.0091775, longitude_start: 105.8614859,
      address_finish: "finish 58", latitude_finish: 21.0111405, longitude_finish: 105.8552954,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice159",
      address_start: "start 59", latitude_start: 21.0095855, longitude_start: 105.8538305,
      address_finish: "finish 59", latitude_finish: 21.0015472, longitude_finish: 105.852424,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice160",
      address_start: "start 60", latitude_start: 21.011365, longitude_start: 105.852981,
      address_finish: "finish 60", latitude_finish: 21.0057679, longitude_finish: 105.8599404,
      status: "cancel", user_id: 1,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice161",
      address_start: "start 61", latitude_start: 21.0109244, longitude_start: 105.8493809,
      address_finish: "finish 61", latitude_finish: 21.007683, longitude_finish: 105.8459712,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice162",
      address_start: "start 62", latitude_start: 21.0123202, longitude_start: 105.859587,
      address_finish: "finish 62", latitude_finish: 21.0144034, longitude_finish: 105.8537183,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice163",
      address_start: "start 63", latitude_start: 21.0129412, longitude_start: 105.8544372,
      address_finish: "finish 63", latitude_finish: 21.0132917, longitude_finish: 105.8616255,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice164",
      address_start: "start 64", latitude_start: 21.0166168, longitude_start: 105.8586751,
      address_finish: "finish 64", latitude_finish: 21.0206528, longitude_finish: 105.8510254,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice165",
      address_start: "start 65", latitude_start: 21.0047933, longitude_start: 105.8585421,
      address_finish: "finish 65", latitude_finish: 21.0040025, longitude_finish: 105.8680033,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice166",
      address_start: "start 66", latitude_start: 21.0053847, longitude_start: 105.8596241,
      address_finish: "finish 66", latitude_finish: 21.0053883, longitude_finish: 105.871486,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice167",
      address_start: "start 67", latitude_start: 21.0059004, longitude_start: 105.8645596,
      address_finish: "finish 67", latitude_finish: 21.0145153, longitude_finish: 105.8649442,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice168",
      address_start: "start 68", latitude_start: 21.0193116, longitude_start: 105.8572014,
      address_finish: "finish 68", latitude_finish: 21.0244798, longitude_finish: 105.8491934,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice169",
      address_start: "start 69", latitude_start: 21.0212025, longitude_start: 105.8505825,
      address_finish: "finish 69", latitude_finish: 21.0227348, longitude_finish: 105.8588185,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice170",
      address_start: "start 70", latitude_start: 21.0065532, longitude_start: 105.8438629,
      address_finish: "finish 70", latitude_finish: 21.010269, longitude_finish: 105.8459939,
      status: "cancel", user_id: 2,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice171",
      address_start: "start 71", latitude_start: 21.0134527, longitude_start: 105.8467134,
      address_finish: "finish 71", latitude_finish: 21.0141938, longitude_finish: 105.8537301,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice172",
      address_start: "start 72", latitude_start: 21.0152354, longitude_start: 105.8617874,
      address_finish: "finish 72", latitude_finish: 21.0252924, longitude_finish: 105.8566079,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice173",
      address_start: "start 73", latitude_start: 21.0321767, longitude_start: 105.8461786,
      address_finish: "finish 73", latitude_finish: 21.0330936, longitude_finish: 105.8551921,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice174",
      address_start: "start 74", latitude_start: 21.0249921, longitude_start: 105.8486046,
      address_finish: "finish 74", latitude_finish: 21.0191158, longitude_finish: 105.8473777,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice175",
      address_start: "start 75", latitude_start: 21.0157333, longitude_start: 105.8576068,
      address_finish: "finish 75", latitude_finish: 21.0151729, longitude_finish: 105.8539703,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice176",
      address_start: "start 76", latitude_start: 21.0180744, longitude_start: 105.850266,
      address_finish: "finish 76", latitude_finish: 21.0183088, longitude_finish: 105.8586031,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice177",
      address_start: "start 77", latitude_start: 21.0319187, longitude_start: 105.8552974,
      address_finish: "finish 77", latitude_finish: 21.0181074, longitude_finish: 105.8557244,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice178",
      address_start: "start 78", latitude_start: 21.0054614, longitude_start: 105.8658601,
      address_finish: "finish 78", latitude_finish: 21.0077049, longitude_finish: 105.8605386,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice179",
      address_start: "start 79", latitude_start: 21.0033221, longitude_start: 105.8592025,
      address_finish: "finish 79", latitude_finish: 21.0071298, longitude_finish: 105.8693318,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice180",
      address_start: "start 80", latitude_start: 21.0131, longitude_start: 105.8619079,
      address_finish: "finish 80", latitude_finish: 21.0163935, longitude_finish: 105.8565611,
      status: "cancel", user_id: 3,weight: 3, delivery_time: "17m",
      distance_invoice: 18, price: 220000, shipping_price: 22000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice181",
      address_start: "start 181", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 181", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice182",
      address_start: "start 182", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 182", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice183",
      address_start: "start 183", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 183", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice184",
      address_start: "start 184", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 184", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice185",
      address_start: "start 185", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 185", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice186",
      address_start: "start 186", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 186", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice187",
      address_start: "start 187", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 187", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice188",
      address_start: "start 188", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 188", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice189",
      address_start: "start 189", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 189", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice190",
      address_start: "start 190", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 190", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice191",
      address_start: "start 191", latitude_start: 21.00809099740665, longitude_start: 105.8351485501098,
      address_finish: "finish 191", latitude_finish: 21.00332345361407, longitude_finish: 105.84785149200434,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice192",
      address_start: "start 192", latitude_start: 21.001320238508796, longitude_start: 105.83549187286371,
      address_finish: "finish 192", latitude_finish: 21.009012437884255, longitude_finish: 105.8342473278808,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice193",
      address_start: "start 193", latitude_start: 21.005807403000656, longitude_start: 105.81536457641596,
      address_finish: "finish 193", latitude_finish: 21.011215859427857, longitude_finish: 105.81858322723383,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice194",
      address_start: "start 194", latitude_start: 21.010294432559697, longitude_start: 105.83386108978266,
      address_finish: "finish 194", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice195",
      address_start: "start 195", latitude_start: 21.016744301107924, longitude_start: 105.8324448834228,
      address_finish: "finish 195", latitude_finish: 21.02553730602834, longitude_finish: 105.82656548126215,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice196",
      address_start: "start 196", latitude_start: 21.025737596226822, longitude_start: 105.82053587539667,
      address_finish: "finish 196", latitude_finish: 21.030203997731203, longitude_finish: 105.83594248397822,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice197",
      address_start: "start 197", latitude_start: 21.03158595135035, longitude_start: 105.82632944686884,
      address_finish: "finish 197", latitude_finish: 21.033748983459823, longitude_finish: 105.815192915039,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice198",
      address_start: "start 198", latitude_start: 21.035911984168646, longitude_start: 105.80360577209467,
      address_finish: "finish 198", latitude_finish: 21.038235172173422, longitude_finish: 105.81660912139887,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice199",
      address_start: "start 199", latitude_start: 21.04222055685705, longitude_start: 105.80549404724115,
      address_finish: "finish 199", latitude_finish: 21.015201966611606, longitude_finish: 105.82806751831049,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice200",
      address_start: "start 200", latitude_start: 21.04534470344829, longitude_start: 105.80676004989618,
      address_finish: "finish 200", latitude_finish: 21.0399174581113, longitude_finish: 105.79004452331537,
      status: "init", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice201",
      address_start: "start 201", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 201", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice202",
      address_start: "start 202", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 202", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice203",
      address_start: "start 203", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 203", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice204",
      address_start: "start 204", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 204", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice205",
      address_start: "start 205", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 205", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice206",
      address_start: "start 206", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 206", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice207",
      address_start: "start 207", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 207", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice208",
      address_start: "start 208", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 208", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice209",
      address_start: "start 209", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 209", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice210",
      address_start: "start 210", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 210", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "waiting", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice211",
      address_start: "start 201", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 201", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice212",
      address_start: "start 202", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 202", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice213",
      address_start: "start 203", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 203", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice214",
      address_start: "start 204", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 204", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice215",
      address_start: "start 205", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 205", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice216",
      address_start: "start 206", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 206", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice217",
      address_start: "start 207", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 207", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice218",
      address_start: "start 208", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 208", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice219",
      address_start: "start 209", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 209", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice220",
      address_start: "start 220", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 220", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "shipping", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice221",
      address_start: "start 211", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 211", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice222",
      address_start: "start 212", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 212", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice223",
      address_start: "start 213", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 213", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice224",
      address_start: "start 214", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 214", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice225",
      address_start: "start 215", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 215", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice226",
      address_start: "start 216", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 216", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice227",
      address_start: "start 217", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 217", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice228",
      address_start: "start 218", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 218", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice229",
      address_start: "start 219", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 219", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice230",
      address_start: "start 230", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 230", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "shipped", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice231",
      address_start: "start 231", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 231", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice232",
      address_start: "start 232", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 232", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice233",
      address_start: "start 233", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 233", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice234",
      address_start: "start 234", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 234", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice235",
      address_start: "start 235", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 235", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice236",
      address_start: "start 236", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 236", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice237",
      address_start: "start 237", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 237", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice238",
      address_start: "start 238", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 238", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice239",
      address_start: "start 239", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 239", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice240",
      address_start: "start 240", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 240", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "finished", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice241",
      address_start: "start 241", latitude_start: 21.00704936218812, longitude_start: 105.81643746002192,
      address_finish: "finish 241", latitude_finish: 21.006288162622013, longitude_finish: 105.82716629608149,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice242",
      address_start: "start 242", latitude_start: 21.009092562874073, longitude_start: 105.83017037017817,
      address_finish: "finish 242", latitude_finish: 21.015903029723454, longitude_finish: 105.83253071411127,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice243",
      address_start: "start 243", latitude_start: 21.01582290839173, longitude_start: 105.82390472991938,
      address_finish: "finish 243", latitude_finish: 21.01678436153148, longitude_finish: 105.80433533294672,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice244",
      address_start: "start 244", latitude_start: 21.015622604874103, longitude_start: 105.81489250762934,
      address_finish: "finish 244", latitude_finish: 21.008932312851115, longitude_finish: 105.802404142456,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice245",
      address_start: "start 245", latitude_start: 21.00416479594, longitude_start: 105.80897019012446,
      address_finish: "finish 245", latitude_finish: 21.005246514817692, longitude_finish: 105.8168666134643,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice246",
      address_start: "start 246", latitude_start: 21.011736663400807, longitude_start: 105.82021401031488,
      address_finish: "finish 246", latitude_finish: 21.011736663400807, longitude_finish: 105.81266090972895,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice247",
      address_start: "start 247", latitude_start: 21.012257465555606, longitude_start: 105.80266163452143,
      address_finish: "finish 247", latitude_finish: 21.01253789673197, longitude_finish: 105.79459354980463,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice248",
      address_start: "start 248", latitude_start: 21.01878736899727, longitude_start: 105.81785366638178,
      address_finish: "finish 248", latitude_finish: 21.012017095556256, longitude_finish: 105.8434312115478,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice249",
      address_start: "start 249", latitude_start: 21.01381986110979, longitude_start: 105.8327882061767,
      address_finish: "finish 249", latitude_finish: 21.006408352285373, longitude_finish: 105.84154293640131,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
    Invoice.create!(
      name: "invoice250",
      address_start: "start 250", latitude_start: 21.001560625741096, longitude_start: 105.85124180419916,
      address_finish: "finish 250", latitude_finish: 21.000919592261187, longitude_finish: 105.8342473278808,
      status: "cancel", user_id: 11,weight: 3, delivery_time: "30m",
      distance_invoice: 25, price: 200000, shipping_price: 20000, customer_name: "khach hang", customer_number: "123456789")
  end
end
