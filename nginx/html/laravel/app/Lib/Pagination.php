<?php

namespace App\Lib;

use Illuminate\Pagination\LengthAwarePaginator;

class Pagination extends LengthAwarePaginator
{
    public function __construct($items, $total, $perPage, $currentPage = null, array $options = [])
    {
        parent::__construct($items, $total, $perPage, $currentPage, $options);
    }

    /**
     * Get the instance as an array.
     *
     * @return array
     */
    public function toArray(): array
    {
        //自定义需要返回的数据
        return [
            'code' => 0,
            'page' => $this->currentPage(),
            'total' => $this->total(),
            'pageSize' => $this->perPage(),
            'data' => $this->items->toArray(),
        ];
    }
}
