import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';

class TicketDetail extends StatelessWidget {
  const TicketDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 4, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/image/png/Slide_4.png"),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "1900 LEMe HaNoi",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Text(
                "Sponsored",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.asset(
                "assets/image/png/ticket_1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "1900 Buffer Drinks Ladies Night",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          ExtendedText(
            "Reque gloriatur libris porta voluptatum expetenda. Intellegat eloquentiam verterem populo maluisset non turpis commune maluisset delicata. Aenean laoreet detraxit alterum accumsan quis netus. Novum reque dicta mel volumus. His felis qualisque at pharetra netus laoreet.",
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflowWidget: TextOverflowWidget(
              position: TextOverflowPosition.end,
              align: TextOverflowAlign.center,
              child: DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.grey),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('\u2026 '),
                    InkWell(
                      child: const Text(
                        'Xem thêm',
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Row(
            children: [
              Icon(Icons.place),
              SizedBox(
                width: 8,
              ),
              Text("Nhà hát lớn Ha Noi"),
              Spacer(),
              Text("Discount for 2"),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.alarm),
              SizedBox(
                width: 8,
              ),
              Text("19:30 - 24:30 PM"),
              Spacer(),
              Icon(Icons.piano),
              SizedBox(
                width: 8,
              ),
              Text("360,000 VND")
            ],
          ),
          const Row(
            children: [
              Icon(Icons.date_range),
              SizedBox(
                width: 8,
              ),
              Text("24/3/2022"),
              Spacer(),
              Text("430,000 VND",
                  style: TextStyle(decoration: TextDecoration.lineThrough))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Đặt vé ngay")
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Thích"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
