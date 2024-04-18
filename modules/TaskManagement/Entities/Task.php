<?php

namespace Modules\TaskManagement\Entities;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'is_completed',
        'user_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    /**
     * Format User Created At.
     */
    public function getCreatedAtAttribute(): string
    {
        return \date('d M, Y', \strtotime($this->attributes['created_at']));
    }

    /**
     * Format User Updated At.
     */
    public function getUpdatedAtAttribute(): string
    {
        return \date('d M, Y', \strtotime($this->attributes['updated_at']));
    }
}
