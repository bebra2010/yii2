<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class RegisterForm extends Model
{
    public $name;
    public $surname;
    public $patronymic;
    public $login;
    public $email;
    public $password;
    public $password_repeat;
    public $rules;


    /**
     * @return array the validation rules.
     */
    public function rules() //правила валидации
    {
        return [
            [['name', 'email', 'surname', 'login', 'password', 'password_repeat', 'rules'], 'required', 'message' => 'Hello world'],
            [['email', 'login'], 'unique', 'targetClass' => User::class], //по заданию уникальные
            ['password', 'string', 'min' => 6],
            ['password_repeat', 'compare', 'compareAttribute' => 'password'], //сравнивание pass_r с pass
            ['patronymic', 'string'], //safe использовать нельзя
            ['rules', 'compare', 'compareValue' => 1],
        ];
    }

    /**
     * @return array customized attribute labels
     */
    public function attributeLabels()
    {
        return [
            'name' => 'Имя',
            'surname' => 'Фамилия',
            'patronymic' => 'Отчество',
            'login' => 'Логин',
            'email' => 'Почта',
            'password' => 'Пароль',
            'password_repeat' => 'Повторите пароль',
            'rules' => 'Соглашение',
        ];
    }

    /**
     * Sends an email to the specified email address using the information collected by this model.
     * @param string $email the target email address
     * @return bool whether the model passes validation
     */
    public function contact($email)
    {
        if ($this->validate()) {
            Yii::$app->mailer->compose()
                ->setTo($email)
                ->setFrom([Yii::$app->params['senderEmail'] => Yii::$app->params['senderName']])
                ->setReplyTo([$this->email => $this->name])
                ->setSubject($this->subject)
                ->setTextBody($this->body)
                ->send();

            return true;
        }
        return false;
    }

    //регистрация пользователя
    public function registerUser()
    {
        if($this->validate() )
        {
            $user = new User();
            if ($user->load($this->attributes, ''))
            {
                if($user->save())
                {
                    return $user;
                }
            }
        }
        return false;
    }
}
