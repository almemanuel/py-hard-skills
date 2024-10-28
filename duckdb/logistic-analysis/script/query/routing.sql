with pickup_problem as (
    select
        distinct service_order.id as service_order_id
    from service_order
    left join service_order_item on
        service_order_item.service_order_id = service_order.id
    left join service_order_item_process on
        service_order_item_process.service_order_item_id = service_order_item.id
    where
        service_order_item_process.service_process_type_name in ('Pickup', 'TransferPickup') and
        service_order_item_process.status in ('Pickup Failed', 'Not available', 'AddressNotFound', 'Not found', 'Interrupted', 'Divergent information', 'Didnt fit', 'Canceled')
),
delivery_problem as (
    select
        distinct service_order.id as service_order_id
    from service_order
    left join service_order_item on
        service_order_item.service_order_id = service_order.id
    left join service_order_item_process on
        service_order_item_process.service_order_item_id = service_order_item.id
    where
        service_order_item_process.service_process_type_name in ('Delivery', 'TransferDelivery') and
        service_order_item_process.status in ('DeliveredWithoutConfirmation', 'CustomerNotFound', 'Loss', 'Damaged',
        'AddressNotFound', 'CustomerMoved', 'CustomerRefused', 'Theft', 'recoveryFail', 'Canceled', 'Interrupted')
)

select
    routing.id as id,
    count(service_order.id) as total_service_orders,
    sum(service_order_item.volume) as total_volume,
    sum(service_order_item.weight) as total_weight,
    count(
        case
            when service_order.status = 'Finished' then 1
        end
    ) as total_finished_service_orders,
    routing.start_date - routing.accept_date as days_to_start,
    routing.accept_date - routing.created_at as days_to_accept,
    count(
        case
            when pickup_problem.service_order_id is not null then 1
        end
    ) as total_pickup_problems,
    count(
        case
            when delivery_problem.service_order_id is not null then 1
        end
    ) as total_delivery_problems
from routing
left join routing_item on
    routing_item.routing_id = routing.id
left join service_order_item_process on
    service_order_item_process.id = routing_item.service_order_item_process_id
left join service_order_item on
    service_order_item.id = service_order_item_process.service_order_item_id
left join service_order on
    service_order.id = service_order_item.service_order_id
left join pickup_problem on
    service_order.id = pickup_problem.service_order_id
left join delivery_problem on
    service_order.id = delivery_problem.service_order_id
group by
    routing.id,
    routing.start_date - routing.accept_date,
    routing.accept_date - routing.created_at