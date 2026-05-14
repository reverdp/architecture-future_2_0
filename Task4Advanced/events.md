## Каталог доменных событий

| Событие                  | Контекст-источник     | Семантика                                  | Минимальный контракт                                               |
|--------------------------|-----------------------|--------------------------------------------|--------------------------------------------------------------------|
| PatientRegistered        | Управление пациентами | Зарегистрирован новый пациент              | eventId, createdAt, patientId                                     |
| MedicalCaseCreated       | Медицинские услуги    | Создан медицинский случай                  | eventId, createdAt, medicalCaseId, patientId, doctorId            |
| TreatmentAssigned        | Медицинские услуги    | Пациенту назначено лечение                 | eventId, createdAt, treatmentPlanId, medicalCaseId, patientId     |
| AIResearchRequested      | Медицинские услуги    | Запрошено ИИ-исследование                  | eventId, createdAt, aiResearchId, medicalCaseId, patientId           |
| MedicationOrderCreated   | Медицинские услуги    | Создан заказ лекарств                      | eventId, createdAt, medicationOrderId, treatmentPlanId, patientId |
| AIResearchCompleted      | ИИ-диагностика        | ИИ-исследование завершено                  | eventId, createdAt, aiResearchId, status, resultRef                  |
| InvoiceIssued            | Счета и оплаты        | Выставлен счёт                             | eventId, createdAt, invoiceId, patientId, amount, currency        |
| PaymentReceived          | Счета и оплаты        | Оплата получена                            | eventId, createdAt, paymentId, invoiceId, amount, currency        |
| PaymentFailed            | Счета и оплаты        | Оплата не прошла                           | eventId, createdAt, paymentId, invoiceId, reason                  |
| CreditApplicationCreated | Финтех-сервисы        | Создана кредитная заявка                   | eventId, createdAt, creditApplicationId, patientId, amount        |
| CreditContractCreated    | Финтех-сервисы        | Создан кредитный договор                   | eventId, createdAt, creditContractId, patientId, amount, term     |
| CreditRejected           | Финтех-сервисы        | Кредитная заявка отклонена                 | eventId, createdAt, creditApplicationId, reason                   |
| DeviceDataReceived       | Партнёры              | Получены данные от медицинского устройства | eventId, createdAt, deviceId, patientId, dataType, dataRef        |
| MedicationOrderCompleted | Партнёры              | Заказ лекарств выполнен партнёром          | eventId, createdAt, medicationOrderId, status                     |
| DataSetUpdated           | Платформа данных      | Обновлена аналитическая витрина            | eventId, createdAt, datasetId, sourceEventType                    |
