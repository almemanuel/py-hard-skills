with last_routing as (
    select
        routing.id as id,
        cast(service_order.id as integer) as service_order_id,
        max(routing.created_at) as last_time
    from service_order
    left join service_order_item on
        service_order.id = service_order_item.service_order_id
    left join service_order_item_process on
        service_order_item.id = service_order_item_process.service_order_item_id
    left join routing_item on
        service_order_item_process.id = routing_item.service_order_item_process_id
    left join routing on
        routing_item.routing_id = routing.id
    group by
        routing.id,
        service_order.id
)
select
    service_order.id as id,
    last_routing.id as last_route,
    count(distinct routing.id) as total_routes,
    count(service_order_item_process.id) as total_processes,
    count(
        case
            when service_order_item_process.service_process_type_name in ('Pickup', 'TransferPickup') then 1
        end
    ) as total_pickup_processes,
    count(
        case
            when service_order_item_process.service_process_type_name in ('Delivery', 'TransferDelivery') then 1
        end
    ) as total_delivery_processes,
    sum(service_order_item.weight) as total_weight,
    sum(service_order_item.volume) as total_volume
from service_order
left join service_order_item on
    service_order.id = service_order_item.service_order_id
left join service_order_item_process on
    service_order_item.id = service_order_item_process.service_order_item_id
left join routing_item on
    service_order_item_process.id = routing_item.service_order_item_process_id
left join routing on
    routing_item.routing_id = routing.id
left join last_routing on
    service_order.id = last_routing.service_order_id
group by
    service_order.id,
    last_routing.id