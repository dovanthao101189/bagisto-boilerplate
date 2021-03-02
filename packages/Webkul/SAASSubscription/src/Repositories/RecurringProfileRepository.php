<?php

namespace Webkul\SAASSubscription\Repositories;

use Webkul\Core\Eloquent\Repository;

class RecurringProfileRepository extends Repository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    function model()
    {
        return 'Webkul\SAASSubscription\Contracts\RecurringProfile';
    }
}