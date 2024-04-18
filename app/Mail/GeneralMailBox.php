<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Modules\Marketing\Entities\MailReport;

class GeneralMailBox extends Mailable
{
    use Queueable, SerializesModels;

    public $mailReport;

    /**
     * Create a new message instance.
     */
    public function __construct(MailReport $mailReport)
    {
        $this->mailReport = $mailReport;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: $this->mailReport->subject,
            bcc: $this->mailReport->mails,
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'marketing::mail.general-mail-box',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        if ($this->mailReport->attachment) {
            return [
                Attachment::fromPath($this->mailReport->attachment),
            ];
        }

        return [];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('marketing::mail.general-mail-box')
            ->with(['mailReport' => $this->mailReport]);
    }
}
