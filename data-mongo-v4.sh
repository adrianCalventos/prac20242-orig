set -e

mongo <<EOF
use $MONGO_INITDB_DATABASE

db.createUser({
   user: '$MONGO_USERNAME',
   pwd: '$MONGO_PASSWORD',
   roles: [
      { role: "read", db: '$MONGO_INITDB_DATABASE' }
   ]
})

db.receipts.insertMany( [
  {
      "url": "https://www.bbcgoodfood.com/recipes/matcha-breakfast-bowl",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/matcha-breakfast-bowl-0e1cd88.jpg",
      "name": "Matcha breakfast bowl",
      "description": "Mix nutritious matcha powder with natural yogurt in this maple syrup and fruit-topped breakfast that's 2 of your 5-a-day ",
      "rattings": 4,
      "times": {
          "Preparation": "15 mins",
          "Cooking": "No Time"
      },
      "difficult": "Easy"
  },
  {
      "url": "https://www.bbcgoodfood.com/recipes/chia-almond-overnight-oats",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chia-almond-overnight-oats-with-raspberries-and-blueberries-1-440-400-98ea1d8.jpg",
      "name": "Chia & almond overnight oats",
      "description": "Start the day with energising oats and omega-3-rich chia seeds with this delicious breakfast. It's vegan, but you can use cow's milk and yogurt, if you prefer",
      "rattings": 5,
      "times": {
          "Preparation": "10 mins",
          "Cooking": "No Time"
      },
      "difficult": "Easy"
  },
  {
      "url": "https://www.bbcgoodfood.com/recipes/blueberry-nut-oat-bake",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/blueberry-nut-oat-bake-4a1dd90.jpg",
      "name": "Blueberry baked oats",
      "description": "Swap your regular porridge for a healthy baked version, packed with oats, juicy blueberries and crunchy almonds. It's a warming breakfast for cold mornings",
      "rattings": 5,
      "times": {
          "Preparation": "5 mins",
          "Cooking": "35 mins"
      },
      "difficult": "Easy"
  },
  {
      "url": "https://www.bbcgoodfood.com/recipes/overnight-oats",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/overnight-oats-32a2747.jpg",
      "name": "Overnight oats",
      "description": "Adapt this recipe for easy overnight oats to suit your tastes. You can add dried fruit, seeds and nuts, grated apple or pear or chopped tropical fruits for the perfect healthy breakfast",
      "rattings": 4,
      "times": {
          "Preparation": "10 mins",
          "Cooking": "No Time"
      },
      "difficult": "Easy"
  },
  {
      "url": "https://www.bbcgoodfood.com/recipes/homemade-muesli-oats-dates-berries",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/homemade-muesli-with-oats-dates-berries-copy-f17fb44.jpg",
      "name": "Homemade muesli with oats, dates & berries",
      "description": "Packed with oats, pecans, seeds, dates, puffed wheat and berries, this delicious breakfast muesli will help you to start your day the right way",
      "rattings": 4,
      "times": {
          "Preparation": "5 mins",
          "Cooking": "2 mins"
      },
      "difficult": "Easy"
  },
  {
      "url": "https://www.bbcgoodfood.com/recipes/banana-overnight-oats",
      "image": "https://images.immediate.co.uk/production/volatile/sites/30/2022/01/Banana-Overnight-Oats-16f2208.jpg",
      "name": "Banana overnight oats",
      "description": "Rustle up these easy overnight oats made with bananas, nut butter and almonds for a tasty breakfast. Prepped the night before, they're ideal for busy mornings",
      "rattings": 5,
      "times": {
          "Preparation": "5 mins",
          "Cooking": "No Time"
      },
      "difficult": "Easy"
  }
])

EOF