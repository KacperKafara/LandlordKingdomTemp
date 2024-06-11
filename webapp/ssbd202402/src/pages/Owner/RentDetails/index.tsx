import { FC } from "react";
import RentInformation from "./RentInformation";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Card, CardHeader, CardTitle } from "@/components/ui/card";
import { useParams, useSearchParams } from "react-router-dom";
import { useOwnerRent } from "@/data/rent/useOwnerRent";
import { RentPayments } from "@/components/RentPayments";
import { useBreadcrumbs } from "@/hooks/useBreadcrumbs";
import { useTranslation } from "react-i18next";
import { RentFixedFees } from "@/components/RentFixedFees";
import { RentVariableFees } from "@/components/RentVariableFees";
import { LoadingData } from "@/components/LoadingData";
import CreatePaymentDialog from "./CreatePaymentDialog";

const OwnerRentDetailsPage: FC = () => {
  const { id } = useParams<{ id: string }>();
  const { t } = useTranslation();
  const { data, isLoading } = useOwnerRent(id!);
  const [searchParams] = useSearchParams();
  const referer = searchParams.get("referer");
  const breadcrumbs = useBreadcrumbs([
    {
      title: t("roles.tenant"),
      path: "/tenant",
    },
    {
      title:
        referer === "archival-rents"
          ? t("breadcrumbs.archivalRents")
          : t("breadcrumbs.currentRents"),
      path: `/tenant/${referer === "archival-rents" ? "archival-rents" : "current-rents"}`,
    },
    {
      title: data
        ? `${data.local.name} (${data.startDate} - ${data.endDate})`
        : "",
      path: `/tenant/rents/${id}`,
    },
  ]);

  if (isLoading) {
    return <LoadingData />;
  }
  return (
    <div className="flex justify-center">
      <div className="flex w-10/12 flex-col pt-10">
        {breadcrumbs}
        <Tabs className="mt-2" defaultValue="rentInformation">
          <div className="flex flex-row justify-between">
            <TabsList>
              <TabsTrigger value="rentInformation">
                {t("ownerRentDetails.rentInfo")}
              </TabsTrigger>
              <TabsTrigger value="payments">
                {t("ownerRentDetails.payments")}
              </TabsTrigger>
              <TabsTrigger value="fixedFees">
                {t("ownerRentDetails.fixedFees")}
              </TabsTrigger>
              <TabsTrigger value="variableFees">
                {t("ownerRentDetails.variableFees")}
              </TabsTrigger>
            </TabsList>
            {data && <CreatePaymentDialog rentId={data?.id} />}
          </div>
          <TabsContent value="rentInformation">
            <RentInformation rent={data} />
          </TabsContent>
          <TabsContent value="payments">
            {data ? (
              <RentPayments
                id={id!}
                startDate={data!.startDate}
                endDate={data!.endDate}
              />
            ) : (
              <Card>
                <CardHeader className="text-center">
                  <CardTitle>{t("ownerRentDetails.noPayments")}</CardTitle>
                </CardHeader>
              </Card>
            )}
          </TabsContent>
          <TabsContent value="fixedFees">
            <RentFixedFees
              id={id!}
              startDate={data!.startDate}
              endDate={data!.endDate}
            />
          </TabsContent>
          <TabsContent value="variableFees">
            <RentVariableFees
              id={id!}
              startDate={data!.startDate}
              endDate={data!.endDate}
            />
          </TabsContent>
        </Tabs>
      </div>
    </div>
  );
};

export default OwnerRentDetailsPage;
