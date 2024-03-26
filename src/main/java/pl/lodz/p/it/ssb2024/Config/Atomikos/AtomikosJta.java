package pl.lodz.p.it.ssb2024.Config.Atomikos;

import jakarta.transaction.TransactionManager;
import jakarta.transaction.UserTransaction;
import org.hibernate.engine.transaction.jta.platform.internal.AbstractJtaPlatform;

import java.io.Serial;

public class AtomikosJta extends AbstractJtaPlatform {

    @Serial
    private static final long serialVersionUID = 1L;

    static TransactionManager transactionManager;
    static UserTransaction transaction;

    @Override
    protected TransactionManager locateTransactionManager() {
        return transactionManager;
    }

    @Override
    protected UserTransaction locateUserTransaction() {
        return transaction;
    }
}
